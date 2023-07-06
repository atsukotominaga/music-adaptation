## ----setup, include = FALSE---------------------------------------------------
# set chunk option
knitr::opts_chunk$set(echo = FALSE)

# packages
# data manipulation
if (!require("data.table")) {install.packages("data.table"); require("data.table")}
# stats
if (!require("afex")) {install.packages("afex"); require("afex")}
if (!require("emmeans")) {install.packages("emmeans"); require("emmeans")}
# plot
if (!require("ggpubr")) {install.packages("ggpubr"); require("ggpubr")}


## ----file, include = FALSE----------------------------------------------------
data_ioi = "preprocessor/trimmed/dt_ioi_trimmed.txt"
data_kot = "preprocessor/trimmed/dt_kot_trimmed.txt"
data_vel = "preprocessor/trimmed/dt_vel_trimmed.txt"
data_vel_diff = "preprocessor/trimmed/dt_vel_diff_trimmed.txt"
data_bl_ioi = "preprocessor/predata/trimmed/dt_ioi_trimmed.txt"
data_bl_kot = "preprocessor/predata/trimmed/dt_kot_trimmed.txt"
data_bl_vel = "preprocessor/predata/trimmed/dt_vel_trimmed.txt"
data_bl_vel_diff = "preprocessor/predata/trimmed/dt_vel_diff_trimmed.txt"


## ----prep, include = FALSE----------------------------------------------------
# read data
dt_ioi <- fread(data_ioi, header = T, sep = ",", dec = ".")
dt_kot <- fread(data_kot, header = T, sep = ",", dec = ".")
dt_vel <- fread(data_vel, header = T, sep = ",", dec = ".")
dt_vel_diff <- fread(data_vel_diff, header = T, sep = ",", dec = ".")

dt1.list <- list(dt_ioi, dt_kot, dt_vel, dt_vel_diff) # make a list of data tables

# add labels to data tables
label <- function(data){
  data[, "SubNr" := as.factor(data$SubNr)]
  data[, "Stimuli" := as.numeric(gsub(".mid", "", data$Stimuli))]
  data[, c("Articulation", "Dynamics", "Category") := .("NA", "NA", "NA")]
  data[Stimuli < 5, c("Articulation", "Dynamics", "Category") := .("Present", "Absent", "art_only")]
  data[Stimuli > 4 & Stimuli < 9, c("Articulation", "Dynamics", "Category") := .("Absent", "Present", "dyn_only")]
  data[Stimuli > 8 & Stimuli < 13, c("Articulation", "Dynamics", "Category") := .("Present", "Present", "both")]
  data[Stimuli > 12, c("Articulation", "Dynamics", "Category") := .("Absent", "Absent", "none")]
}

# perform the function above
res <- lapply(dt1.list, label)

# read data (baseline performances)
dt_bl_ioi <- fread(data_bl_ioi, header = T, sep = ",", dec = ".")
dt_bl_kot <- fread(data_bl_kot, header = T, sep = ",", dec = ".")
dt_bl_vel <- fread(data_bl_vel, header = T, sep = ",", dec = ".")
dt_bl_vel_diff <- fread(data_bl_vel_diff, header = T, sep = ",", dec = ".")

dt2.list <- list(dt_bl_ioi, dt_bl_kot, dt_bl_vel, dt_bl_vel_diff) # make a list of data tables (baseline performances)

# add labels to data tables
label_bl <- function(data){
  data[, "SubNr" := as.factor(data$SubNr)]
  data[, c("Articulation", "Dynamics", "Category") := .("Baseline", "Baseline", "baseline")]
}

# perform the function above
res_bl <- lapply(dt2.list, label_bl)

# combine data with baseline performance
dt_ioi <- rbind(dt_ioi, dt_bl_ioi)
dt_kot <- rbind(dt_kot, dt_bl_kot)
dt_vel <- rbind(dt_vel, dt_bl_vel)
dt_vel_diff <- rbind(dt_vel_diff, dt_bl_vel_diff)


## ----ioi----------------------------------------------------------------------
# for each individual
dt_ioi$Articulation <- factor(dt_ioi$Articulation, c("Present", "Absent", "Baseline"))
dt_ioi$Dynamics <- factor(dt_ioi$Dynamics, c("Present", "Absent", "Baseline"))

ioi_trial <- dt_ioi[, .(N = .N, Mean = mean(IOI), SD = sd(IOI), CV = sd(IOI)/mean(IOI)), by = .(SubNr, TrialNr, Stimuli, Articulation, Dynamics, Category)]

ioi <- ioi_trial[, .(N = .N, Mean = mean(Mean), SD = sd(Mean), CV = mean(CV)), by = .(SubNr, Articulation, Dynamics, Category)]
setorder(ioi, "SubNr", "Articulation", "Dynamics", "Category")
ioi


## ----ioi-plot, fig.width = 10-------------------------------------------------
ggboxplot(ioi_trial, "Articulation", "Mean", color = "Dynamics", add = "jitter", facet.by = "SubNr", xlab = "Articulation", ylab = "IOIs (ms)", title = "IOI")


## ----ioi-all------------------------------------------------------------------
# group mean
ioi_all <- ioi[, .(N = .N, Mean = mean(Mean), SD = sd(Mean), SEM = sd(Mean)/sqrt(.N), Median = median(Mean), IQR = IQR(Mean), CV = mean(CV)), by = .(Articulation, Dynamics, Category)]
ioi_all


## ----ioi-all-plot-------------------------------------------------------------
ggplot(ioi, aes(x = Articulation, y = Mean, color = Dynamics)) +
  geom_boxplot(outlier.shape = NA, position = position_dodge2(preserve = "single")) +
  geom_point(position = position_jitterdodge(jitter.width = 0.25), alpha = 0.5) + labs(y = "IOI (ms)", title = "IOI") +
  theme_pubr()
 
#ggboxplot(ioi, "Articulation", "Mean", color = "Dynamics", add = "jitter", xlab = "Articulation", ylab = "IOIs (ms)", title = "IOI")


## ----seq-ioi, fig.width = 9, fig.height = 4-----------------------------------
ioi_seq <- dt_ioi[, .(N = .N, Mean = mean(IOI), SD = sd(IOI)), by = .(SubNr, Category, Interval)]

ggline(ioi_seq, x = "Interval", y = "Mean", add = "mean_se", position = position_dodge(.2), shape = "Category", color = "Category", xlab = "Interval", ylab = "IOIs (ms)", title = "IOI") + scale_x_continuous(breaks = seq(1,71,1))


## -----------------------------------------------------------------------------
ioi_all_aov <- aov_ez(
  data = ioi[Category != "baseline"],
  id = "SubNr",
  dv = "Mean",
  within = c("Articulation", "Dynamics"),
  detailed = TRUE
)

ioi_all_aov$anova_table
pairs(emmeans(ioi_all_aov, ~Dynamics|Articulation), adjust = "tukey")


## -----------------------------------------------------------------------------
ioi_ca_all_aov <- aov_ez(
  data = ioi,
  id = "SubNr",
  dv = "Mean",
  within = c("Category")
)

ioi_ca_all_aov$anova_table
pairs(emmeans(ioi_ca_all_aov, "Category"), adjust = "tukey")


## -----------------------------------------------------------------------------
ioi_ca_par_aov <- aov_ez(
  data = ioi[Category == "both" | Category == "none" | Category == "baseline"],
  id = "SubNr",
  dv = "Mean",
  within = c("Category")
)

ioi_ca_par_aov$anova_table
pairs(emmeans(ioi_ca_par_aov, "Category"), adjust = "tukey")


## -----------------------------------------------------------------------------
var_stats <- aov_ez(
  data = ioi,
  id = "SubNr",
  dv = "SD",
  within = c("Category")
)

var_stats$anova_table


## ----kot, echo = FALSE--------------------------------------------------------
# for each individual
dt_kot$Articulation <- factor(dt_kot$Articulation, c("Present", "Absent", "Baseline"))
dt_kot$Dynamics <- factor(dt_kot$Dynamics, c("Present", "Absent", "Baseline"))

kot_trial <- dt_kot[Subcomponent1 == "Legato" | Subcomponent1 == "Staccato", .(N = .N, Mean = mean(KOT), SD = sd(KOT)), by = .(SubNr, TrialNr, Stimuli, Articulation, Dynamics, Category, Subcomponent1)]

kot <- kot_trial[, .(N = .N, Mean = mean(Mean), SD = sd(Mean)), by = .(SubNr, Articulation, Dynamics, Category, Subcomponent1)]
setorder(kot, "SubNr", "Subcomponent1", "Articulation", "Dynamics", "Category")
kot


## ----kot-plot,  echo = FALSE, fig.width = 10----------------------------------
ggboxplot(kot_trial[Subcomponent1 == "Legato"], "Articulation", "Mean", color = "Dynamics", add = "jitter", facet.by = "SubNr", xlab = "Articulation", ylab = "KOT (ms)", title = "KOT (Legato)")

ggboxplot(kot_trial[Subcomponent1 == "Staccato"], "Articulation", "Mean", color = "Dynamics", add = "jitter", facet.by = "SubNr", xlab = "Articulation", ylab = "KOT (ms)", title = "KOT (Staccato)")


## ----kot-all, echo = FALSE----------------------------------------------------
# group mean
kot_all <- kot[, .(N = .N, Mean = mean(Mean), SD = sd(Mean), SEM = sd(Mean)/sqrt(.N), Median = median(Mean), IQR = IQR(Mean)), by = .(Articulation, Dynamics, Category, Subcomponent1)]
kot_all


## ----kot-all-plot, echo = FALSE-----------------------------------------------
ggplot(kot[Subcomponent1 == "Legato"], aes(x = Articulation, y = Mean, color = Dynamics)) +
  geom_boxplot(outlier.shape = NA, position = position_dodge2(preserve = "single")) +
  geom_point(position = position_jitterdodge(jitter.width = 0.25), alpha = 0.5) +
  labs(y = "KOT (ms)", title = "KOT - Legato") +
  theme_pubr()

ggplot(kot[Subcomponent1 == "Staccato"], aes(x = Articulation, y = Mean, color = Dynamics)) +
  geom_boxplot(outlier.shape = NA, position = position_dodge2(preserve = "single")) +
  geom_point(position = position_jitterdodge(jitter.width = 0.25), alpha = 0.5) +
  labs(y = "KOT (ms)", title = "KOT - Staccato") +
  theme_pubr()

#ggboxplot(kot[Subcomponent1 == "Legato"], "Articulation", "Mean", color = "Dynamics", add = "jitter", xlab = "Articulation", ylab = "KOT (ms)", title = "KOT (Legato)")

#ggboxplot(kot[Subcomponent1 == "Staccato"], "Articulation", "Mean", color = "Dynamics", add = "jitter", xlab = "Articulation", ylab = "KOT (ms)", title = "KOT (Staccato)")


## ----kot-bar-plot, include = FALSE--------------------------------------------
ggbarplot(kot[Subcomponent1 == "Legato" & Articulation != "Baseline"], x = "Articulation", y = "Mean", add = "mean_se", ylab = "KOT (ms)", ylim = c(40, 60), size = 2) + theme(text = element_text(size = 40))

ggbarplot(kot[Subcomponent1 == "Staccato" & Articulation != "Baseline"], x = "Articulation", y = "Mean", add = "mean_se", ylab = "KOT (ms)", ylim = c(-220, -200), size = 2) + theme(text = element_text(size = 40))


## ----seq-kot, fig.width = 9, fig.height = 4-----------------------------------
kot_seq <- dt_kot[, .(N = .N, Mean = mean(KOT), SD = sd(KOT)), by = .(SubNr, Category, Interval)]

ggline(kot_seq, x = "Interval", y = "Mean", add = "mean_se", position = position_dodge(.2), shape = "Category", color = "Category", xlab = "Interval", ylab = "KOT (ms)", title = "KOT") + scale_x_continuous(breaks = seq(1,71,1))


## -----------------------------------------------------------------------------
leg_all_aov <- aov_ez(
  data = kot[Subcomponent1 == "Legato" & Category != "baseline"],
  id = "SubNr",
  dv = "Mean",
  within = c("Articulation", "Dynamics")
)

leg_all_aov$anova_table
pairs(emmeans(leg_all_aov, ~Dynamics|Articulation), adjust = "tukey")


## -----------------------------------------------------------------------------
leg_ca_all_aov <- aov_ez(
  data = kot[Subcomponent1 == "Legato"],
  id = "SubNr",
  dv = "Mean",
  within = c("Category")
)
leg_ca_all_aov

leg_ca_all_aov$anova_table
pairs(emmeans(leg_ca_all_aov, "Category"), adjust = "tukey")


## -----------------------------------------------------------------------------
leg_ca_par_aov <- aov_ez(
  data = kot[Subcomponent1 == "Legato" & Category == "both" | Subcomponent1 == "Legato" & Category == "dyn_only" | Subcomponent1 == "Legato" & Category == "baseline"],
  id = "SubNr",
  dv = "Mean",
  within = c("Category")
)
leg_ca_par_aov

leg_ca_par_aov$anova_table
pairs(emmeans(leg_ca_par_aov, "Category"), adjust = "tukey")


## -----------------------------------------------------------------------------
sta_all_aov <- aov_ez(
  data = kot[Subcomponent1 == "Staccato" & Category != "baseline"],
  id = "SubNr",
  dv = "Mean",
  within = c("Articulation", "Dynamics")
)

sta_all_aov$anova_table
pairs(emmeans(sta_all_aov, ~Dynamics|Articulation), adjust = "tukey")


## -----------------------------------------------------------------------------
sta_ca_all_aov <- aov_ez(
  data = kot[Subcomponent1 == "Staccato"],
  id = "SubNr",
  dv = "Mean",
  within = c("Category")
)

sta_ca_all_aov$anova_table
pairs(emmeans(sta_ca_all_aov, "Category"), adjust = "tukey")


## -----------------------------------------------------------------------------
sta_ca_par_aov <- aov_ez(
  data = kot[Subcomponent1 == "Staccato" & Category == "both" | Subcomponent1 == "Staccato" & Category == "dyn_only" | Subcomponent1 == "Staccato" & Category == "baseline"],
  id = "SubNr",
  dv = "Mean",
  within = c("Category")
)

sta_ca_par_aov$anova_table
pairs(emmeans(sta_ca_par_aov, "Category"), adjust = "tukey")


## ----vel, echo = FALSE--------------------------------------------------------
# for each individual
dt_vel$Articulation <- factor(dt_vel$Articulation, c("Present", "Absent", "Baseline"))
dt_vel$Dynamics <- factor(dt_vel$Dynamics, c("Present", "Absent", "Baseline"))

vel_trial <- dt_vel[Subcomponent2 != "NA", .(N = .N, Mean = mean(Velocity), SD = sd(Velocity)), by = .(SubNr, TrialNr, Stimuli, Articulation, Dynamics, Category, Subcomponent2)]

vel <- vel_trial[, .(N = .N, Mean = mean(Mean), SD = sd(Mean)), by = .(SubNr, Articulation, Dynamics, Category, Subcomponent2)]
setorder(vel, "SubNr", "Subcomponent2", "SubNr", "Dynamics", "Articulation", "Category")
vel


## ----vel-plot, echo = FALSE, fig.width = 10-----------------------------------
ggboxplot(vel_trial[Subcomponent2 == "Forte"], "Dynamics", "Mean", color = "Articulation", add = "jitter", facet.by = "SubNr", xlab = "SubNr", ylab = "Velocity", title = "KV (Forte)")

ggboxplot(vel_trial[Subcomponent2 == "Piano"], "Dynamics", "Mean", color = "Articulation", add = "jitter", facet.by = "SubNr", xlab = "SubNr", ylab = "Velocity", title = "KV (Piano)")


## ----vel-all, echo = FALSE----------------------------------------------------
# group mean
vel_all <- vel[, .(N = .N, Mean = mean(Mean), SD = sd(Mean), SEM = sd(Mean)/sqrt(.N), Median = median(Mean), IQR = IQR(Mean)), by = .(Articulation, Dynamics, Category, Subcomponent2)]
vel_all


## ----vel-all-plot,  echo = FALSE----------------------------------------------
ggplot(vel[Subcomponent2 == "Forte"], aes(x = Dynamics, y = Mean, color = Articulation))+ 
    geom_boxplot(outlier.shape = NA, position = position_dodge2(preserve = "single")) +
  geom_point(position = position_jitterdodge(jitter.width = 0.25), alpha = 0.5) +
  labs(y = "Key Velocity (0-127)", title = "KV - Forte") +
  theme_pubr()

ggplot(vel[Subcomponent2 == "Piano"], aes(x = Dynamics, y = Mean, color = Articulation))+ 
    geom_boxplot(outlier.shape = NA, position = position_dodge2(preserve = "single")) +
  geom_point(position = position_jitterdodge(jitter.width = 0.25), alpha = 0.5) +
  labs(y = "Key Velocity (0-127)", title = "KV - Piano") +
  theme_pubr()

#ggboxplot(vel[Subcomponent2 == "Forte"], "Dynamics", "Mean", color = "Articulation", add = "jitter", xlab = "Dynamics", ylab = "Velocity", title = "KV (Forte)")

#ggboxplot(vel[Subcomponent2 == "Piano"], "Dynamics", "Mean", color = "Articulation", add = "jitter", xlab = "Dynamics", ylab = "Velocity", title = "KV (Piano)")


## ----vel-bar-plot, include = FALSE--------------------------------------------
ggbarplot(vel[Subcomponent2 == "Forte" & Dynamics != "Baseline"], x = "Dynamics", y = "Mean", add = "mean_se", ylab = "KV (0-127)", ylim = c(75, 85), size = 2) + theme(text = element_text(size = 40)) + scale_y_continuous(breaks=seq(75, 85, 5))

ggbarplot(vel[Subcomponent2 == "Piano" & Dynamics != "Baseline"], x = "Dynamics", y = "Mean", add = "mean_se", ylab = "KV (0-127)", ylim = c(55, 65), size = 2) + theme(text = element_text(size = 40)) + scale_y_continuous(breaks=seq(55, 65, 5))

ggbarplot(vel[Subcomponent2 == "Piano" & Articulation != "Baseline"], x = "Articulation", y = "Mean", add = "mean_se", ylab = "KV (0-127)", ylim = c(55, 65), size = 2) + theme(text = element_text(size = 40)) + scale_y_continuous(breaks=seq(55, 65, 5))


## ----seq-vel, fig.width = 9, fig.height = 4-----------------------------------
vel_seq <- dt_vel[, .(N = .N, Mean = mean(Velocity), SD = sd(Velocity)), by = .(SubNr, Category, RowNr)]

ggline(vel_seq, x = "RowNr", y = "Mean", add = "mean_se", position = position_dodge(.2), shape = "Category", color = "Category", xlab = "Note Nr", ylab = "Key Velocity (0-127)", title = "KV") + scale_x_continuous(breaks = seq(1,72,1))


## -----------------------------------------------------------------------------
for_all_aov <- aov_ez(
  data = vel[Subcomponent2 == "Forte" & Category != "baseline"],
  id = "SubNr",
  dv = "Mean",
  within = c("Articulation", "Dynamics")
)

for_all_aov$anova_table
pairs(emmeans(for_all_aov, ~Articulation|Dynamics), adjust = "tukey")


## -----------------------------------------------------------------------------
for_ca_all_aov <- aov_ez(
  data = vel[Subcomponent2 == "Forte"],
  id = "SubNr",
  dv = "Mean",
  within = c("Category")
)

for_ca_all_aov$anova_table
pairs(emmeans(for_ca_all_aov, "Category"), adjust = "tukey")


## -----------------------------------------------------------------------------
for_ca_par_aov <- aov_ez(
  data = vel[Subcomponent2 == "Forte" & Category == "both" | Subcomponent2 == "Forte" & Category == "art_only" | Subcomponent2 == "Forte" & Category == "baseline"],
  id = "SubNr",
  dv = "Mean",
  within = c("Category")
)

for_ca_par_aov$anova_table
pairs(emmeans(for_ca_par_aov, "Category"), adjust = "tukey")


## -----------------------------------------------------------------------------
pia_all_aov <- aov_ez(
  data = vel[Subcomponent2 == "Piano" & Category != "baseline"],
  id = "SubNr",
  dv = "Mean",
  within = c("Articulation", "Dynamics")
)

pia_all_aov$anova_table
pairs(emmeans(pia_all_aov, ~Articulation|Dynamics), adjust = "tukey")


## -----------------------------------------------------------------------------
pia_ca_all_aov <- aov_ez(
  data = vel[Subcomponent2 == "Piano"],
  id = "SubNr",
  dv = "Mean",
  within = c("Category")
)

pia_ca_all_aov$anova_table
pairs(emmeans(pia_ca_all_aov, "Category"), adjust = "tukey")


## -----------------------------------------------------------------------------
pia_ca_par_aov <- aov_ez(
  data = vel[Subcomponent2 == "Piano" & Category == "both" | Subcomponent2 == "Piano" & Category == "art_only" | Subcomponent2 == "Piano" & Category == "baseline"],
  id = "SubNr",
  dv = "Mean",
  within = c("Category")
)

pia_ca_par_aov$anova_table
pairs(emmeans(pia_ca_par_aov, "Category"), adjust = "tukey")


## ----vel-diff, echo = FALSE---------------------------------------------------
# for each individual
dt_vel_diff$Articulation <- factor(dt_vel_diff$Articulation, c("Present", "Absent", "Baseline"))
dt_vel_diff$Dynamics <- factor(dt_vel_diff$Dynamics, c("Present", "Absent", "Baseline"))

vel_diff_trial <- dt_vel_diff[Subcomponent2 == "FtoP" | Subcomponent2 == "PtoF", .(N = .N, Mean = mean(Diff), SD = sd(Diff)), by = .(SubNr, TrialNr, Stimuli, Articulation, Dynamics, Category, Subcomponent2)]

vel_diff <- vel_diff_trial[, .(N = .N, Mean = mean(Mean), SD = sd(Mean)), by = .(SubNr, Articulation, Dynamics, Category, Subcomponent2)]
setorder(vel_diff, "SubNr", "Subcomponent2", "Dynamics", "Articulation", "Category")
vel_diff


## ----vel-diff-plot, echo = FALSE, fig.width = 10------------------------------
ggboxplot(vel_diff_trial[Subcomponent2 == "FtoP"], "Dynamics", "Mean", color = "Articulation", add = "jitter", facet.by = "SubNr", xlab = "Dynamics", ylab = "Velocity Difference", title = "KV-Diff (FtoP)")

ggboxplot(vel_diff_trial[Subcomponent2 == "PtoF"], "Dynamics", "Mean", color = "Articulation", add = "jitter", facet.by = "SubNr", xlab = "Dynamics", ylab = "Velocity Difference", title = "KV-Diff (PtoF)")


## ----vel-diff-all, echo = FALSE-----------------------------------------------
# group mean
vel_diff_all <- vel_diff[, .(N = .N, Mean = mean(Mean), SD = sd(Mean), SEM = sd(Mean)/sqrt(.N), Median = median(Mean), IQR = IQR(Mean)), by = .(Articulation, Dynamics, Category, Subcomponent2)]
vel_diff_all


## ----vel-diff-all-plot,  echo = FALSE-----------------------------------------
ggplot(vel_diff[Subcomponent2 == "FtoP"], aes(x = Dynamics, y = Mean, color = Articulation))+ 
  geom_boxplot(outlier.shape = NA, position = position_dodge2(preserve = "single")) +
  geom_point(position = position_jitterdodge(jitter.width = 0.25), alpha = 0.5) +
  labs(y = "KV Difference (-127-127)", title = "KV Difference - Forte to Piano") +
  theme_pubr()

ggplot(vel_diff[Subcomponent2 == "PtoF"], aes(x = Dynamics, y = Mean, color = Articulation))+ 
  geom_boxplot(outlier.shape = NA, position = position_dodge2(preserve = "single")) +
  geom_point(position = position_jitterdodge(jitter.width = 0.25), alpha = 0.5) +
  labs(y = "KV Difference (-127-127)", title = "KV Difference - Piano to Forte") +
  theme_pubr()

#ggboxplot(vel_diff[Subcomponent2 == "FtoP"], "Dynamics", "Mean", color = "Articulation", add = "jitter", xlab = "Dynamics", ylab = "Velocity Difference", title = "KV (FtoP)")

#ggboxplot(vel_diff[Subcomponent2 == "PtoF"], "Dynamics", "Mean", color = "Articulation", add = "jitter", xlab = "Dynamics", ylab = "Velocity Difference", title = "KV (PtoF)")


## ----seq-vel-diff, fig.width = 9, fig.height = 4------------------------------
vel_diff_seq <- dt_vel_diff[, .(N = .N, Mean = mean(Diff), SD = sd(Diff)), by = .(SubNr, Category, Interval)]

ggline(vel_diff_seq, x = "Interval", y = "Mean", add = "mean_se", position = position_dodge(.2), shape = "Category", color = "Category", xlab = "Interval", ylab = "Difference", title = "Velocity Difference") + scale_x_continuous(breaks = seq(1,71,1))


## -----------------------------------------------------------------------------
ftop_all_aov <- aov_ez(
  data = vel_diff[Subcomponent2 == "FtoP" & Category != "baseline"],
  id = "SubNr",
  dv = "Mean",
  within = c("Articulation", "Dynamics")
)

ftop_all_aov$anova_table
pairs(emmeans(ftop_all_aov, ~Articulation|Dynamics), adjust = "tukey")


## -----------------------------------------------------------------------------
ftop_ca_all_aov <- aov_ez(
  data = vel_diff[Subcomponent2 == "FtoP"],
  id = "SubNr",
  dv = "Mean",
  within = c("Category")
)

ftop_ca_all_aov$anova_table
pairs(emmeans(ftop_ca_all_aov, "Category"), adjust = "tukey")


## -----------------------------------------------------------------------------
ftop_ca_par_aov <- aov_ez(
  data = vel_diff[Subcomponent2 == "FtoP" & Category == "both" | Subcomponent2 == "FtoP" & Category == "art_only" | Subcomponent2 == "FtoP" & Category == "baseline"],
  id = "SubNr",
  dv = "Mean",
  within = c("Category")
)

ftop_ca_par_aov$anova_table
pairs(emmeans(ftop_ca_par_aov, "Category"), adjust = "tukey")


## -----------------------------------------------------------------------------
ptof_all_aov <- aov_ez(
  data = vel_diff[Subcomponent2 == "PtoF" & Category != "baseline"],
  id = "SubNr",
  dv = "Mean",
  within = c("Articulation", "Dynamics")
)

ptof_all_aov$anova_table
pairs(emmeans(ptof_all_aov, ~Articulation|Dynamics), adjust = "tukey")


## -----------------------------------------------------------------------------
ptof_ca_all_aov <- aov_ez(
  data = vel_diff[Subcomponent2 == "PtoF"],
  id = "SubNr",
  dv = "Mean",
  within = c("Category")
)

ptof_ca_all_aov$anova_table
pairs(emmeans(ptof_ca_all_aov, "Category"), adjust = "tukey")


## -----------------------------------------------------------------------------
ptof_ca_par_aov <- aov_ez(
  data = vel_diff[Subcomponent2 == "PtoF" & Category == "both" | Subcomponent2 == "PtoF" & Category == "art_only" | Subcomponent2 == "PtoF" & Category == "baseline"],
  id = "SubNr",
  dv = "Mean",
  within = c("Category")
)

ptof_ca_par_aov
pairs(emmeans(ptof_ca_par_aov, "Category"), adjust = "tukey")


## ----export, include = FALSE--------------------------------------------------
knitr::purl("baseline.Rmd")

