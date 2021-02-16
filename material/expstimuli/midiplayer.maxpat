{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 1,
			"revision" : 8,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 888.0, 108.0, 239.0, 350.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"fontsize" : 18.0,
					"id" : "obj-9",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 287.0, 80.0, 88.0, 29.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 123.0, 285.333344000000011, 83.0, 29.0 ],
					"text" : "1/2 tem",
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"id" : "obj-3",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 469.0, 29.333344000000011, 152.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 28.0, 319.0, 91.0, 20.0 ],
					"text" : "start playing",
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-26",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 217.0, 135.333344000000011, 25.0, 22.0 ],
					"text" : "t b"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 248.0, 302.0, 62.0, 22.0 ],
					"text" : "midiflush"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-14",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 384.0, 169.0, 305.0, 25.0 ],
					"text" : "read (optional filename) from a text or MIDI file"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-43",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 268.0, 26.333344000000011, 199.0, 25.0 ],
					"text" : "'bang' to play at default speed"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-2",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 384.0, 82.0, 259.0, 25.0 ],
					"text" : "'start' (tempo) with 1024 = normal speed"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-4",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 384.0, 142.0, 180.0, 25.0 ],
					"text" : "stop recording and playing"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-17",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 287.0, 138.0, 82.0, 29.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 123.0, 223.333344000000011, 83.0, 29.0 ],
					"text" : "stop",
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 248.0, 29.333344000000011, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 28.0, 223.333344000000011, 91.0, 91.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-19",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 287.0, 111.0, 59.0, 23.0 ],
					"text" : "start 512",
					"textjustification" : 0
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-24",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "int", "bang" ],
					"patching_rect" : [ 248.0, 267.0, 29.5, 23.0 ],
					"text" : "seq"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-25",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 287.0, 171.0, 82.0, 29.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 123.0, 254.333344000000011, 83.0, 29.0 ],
					"text" : "read",
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-33",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 334.0, 335.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-35",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 248.0, 335.0, 55.0, 23.0 ],
					"text" : "midiout"
				}

			}
, 			{
				"box" : 				{
					"autofit" : 1,
					"data" : [ 50109, "png", "IBkSG0fBZn....PCIgDQRA..B....H..HX.....83Qs9....DLmPIQEBHf.B7g.YHB..f.PRDEDU3wI6cmGWTT++G.+0tK2BrKJp3ABp3sAjkGkhhklYoBpkY4EZoe8JU5TJMjzLsLOJORyC7VKwvixrTC0L0rrE07nPcQTNDPVNjyc242ert7CXmYYum838yGO7AxL6Nu+L6xty64yofamSVLfPHDBg3TwE..wRDCwt4IDZECrJ.TXkkgBkWHEeJ9T7o3SwmhOEeqb7EB.qdvA.D9n3RwmhOEeJ9T7o3Sw25GegZ9E9fv57SJ9T7o3SwmhOEeJ9Vm3yWwlPHDBgvinD.HDBgPbBQI.PHDBg3DhR.fPHDBwIDk..gPHDhSHJA.BgPHDmPTB.DBgPHNgnD.HDBgPbBQI.PHDBg3DhR.fPHDBwIDk..gPHDhSHJA.BgPHDmPTB.DBgPHNgnD.HDBgPbBQI.PHDBg3DhR.fPHDBwIDk..gPHDhSHJA.BgPHDmPTB.DBgPHNgnD.HDBgPbBQI.PHDBg3DhR.fPHDBwIDk..gPHDhSHJA.BgPHDmPTB.DBgPHNgnD.HDBgPbBID.PEOEbU04mT7o3SwmhOEeJ9T7sNwWH.PgUVlUuPn5QwkhOEeJ9T7o3Swmhu0O9BtcNYwXkiMgPHDBgm4B.fXIhgX27zp1g.zjARgxKjhOEeJ9T7o3SwmhuUN9BAfUO3.pa6Awt4In3SwmhOEeJ9T7o3a8iuPM+BePXc9IEeJ9T7o3SwmhOEeqS7ogAHgPHDhSHJA.BgPHDmPTB.DBgPHNgnD.HDBgPbBQI.PHDBg3DhR.fPHDBwIDk..gPHDhSHJA.BgPHDmPTB.DBgPHNgnD.HDBgPbBQI.PHDBg3DhR.fPHDBwIDk..gPHDhSHW36B.w1V94mOt28tGxN6rQVYkEjKWNJqrxP4kWNppppf6t6N7zSOgmd5IZTiZDZYKaIZQKZAZYKaIbyM236hOwAxF1vFvzl1zfJUpp01CIjPv+8e+GOUpHD6W1bI.rfEr.HSlLs1daaaaw7m+7s9EH8vCdvCvG7Ae.Ju7x0ZecnCc.wEWblzw+u9q+BqcsqEJUprVaWjHQXpScpn6cu6lzwG.PkJU3JW4J32+8eGW7hWDW6ZWCW6ZWC4me9F0wyUWcEctycFcqacC8rm8DO+y+7HnfBxjKmFCc85WTuxKifetmmWJWDCy+9u+qVW7G.HszRCJTn.t3hM2WmQH1zro9DSokVJRHgD3b+OwS7D3EdgWvJVhzOwGe7X8qe8rtOABDXxI.r28tWr4MuYV2mXwhMoD.XXXPzQGMNwINAJt3hM5iScUUUUgTSMUjZpohsrks..fN24NiW5kdI7Fuwaf.CLPyVrpO550OAt5BFFk..gPbBYS0G.XK69ZJt3hqdeLVa25V2hyK9Cn9BrlJccNapudTVokhCbfCXVu3OWt5UuJ93O9iQqacqQTQEE9q+5ur3wDn9d8yze+gPHD6Q1TI.TetzktD10t1EeWLpk4O+4ipppJ9tXXWQoRk3fG7fn6cu6XV+uog6bm6v2EIBgPb5XWk...vG8QeDprxJ46hA..jJUJ18t2MeWLrawvvfCkbxHzPC0lKwNBgPbzYS0G.zG2912Fe8W+0XVyZV7cQAwEWblkp32VUfAFHhHhHPG5PGPG5PGPaaaagu95K7wGefO93C7zSOQEUTAJu7xQQEUDt28tGt28tGt10tFt3EuHtvEt.xJqrp23TXgEhwLlwfTRIErt0sNHRjHqvYGgPHN2r6R...XQKZQXhSbhvGe7g2JCojRJ3m9oeh2hu0v3G+3whVzhz4iwKu7Bd4kWngMrgH3fCVq8KUpTb3CeXrksrEbqacKcdr9lu4aPN4jC1yd1C7zSOMkhNgPHj5gcWS...jat4hksrkwqkg2+8eedM91KBO7vw7l27v+8e+GN7gOLd7G+w04i+fG7fXTiZT1bc1SBgPbzXWl...vxW9xw8u+84kXmTRIg+3O9CdI11qDJTHdwW7Ewe8W+E17l2rNq8lCe3Ci29seaqXoiPHDmO1sI.TRIkfEtvEZ0iqRkJwG9genUOtNJDHP.l3DmH96+9uQ3gGNmOtUtxUh8u+8aEKYDBg3bwtMA..f0u90Wusqr41l27lwMtwMrpwzQTaaaaQJojB5lNlDil9zmNdvCdfUrTQHDhyC6lD.XqClUUUUg4Mu4Y0JCkUVYXAKXArtO1JeDcSrXwX66c2nKcoKrt+bxIGpuVPHDhEhP..9p6VopN+TWhO93gWd4kVaeO6YOPpToV73C.rpUsJjYlYp016cu6MhJpnr3w2biu6lcp.fWMnA36OvAfXwhY8wjXhIZwqkG990eJ9T7o3SwmOhuP.fBqrLqdgP0ihq9F+.BH.Darwp01YXXvbm6bs3wufBJ.KcoKk08sjkrDKd7M2pY74C0L99GXywmr3Ey5iSgBE06PQzTw2u9SwmhOEeJ97Q7cA.nP4EhBQgV4hv+OMwuzG9PNeL4Hu.7JwLdrl0tVHufBp09N5QOJ1y2mD5Uu6sIEec4S+3EB4xkq01e1m64PKaeHnnRKkymqr6msIE+hJk6WWJpzRq2iuwpvGVhE6XWq3HuPL3QDM55FVOtRpWRq8uyctSL6499PrD1qkf5itd8SS7sE96eJ95ltdeL86mMDYjqFf1Km+T7o3at4B.fXIhgX27zp1g.zjARgxKr53WZIkv4iuoR7COVHsGyedyi0gH1JVxmgye9yaRwmqy+6d26hssIsWM4DJTHV4W7EH3lD.7kklmPifaR.lT780qFv4w1Wu7h0ie8QS70URWhaf2F0w1PheMO+W3BR.Ce3CWqGakUVINywNNl9zmtQEKc85Gfsye+SwW2z06iA0j.LnkCX6wyeJ9T7M2wWH.r5AGPcaOH1M0y1aFR7mwLlAZUqZkVa+O9i+.IkTRVj3ufEr.Td4kq01G23FG5ZW6pdGSiM9VB0L97A1N+iJpnP6ae6Y8wusssMKVYgue8mhu8Q7qpppvsu8sQpolJN6YOKN9wONNxQNBN9wONNyYNCt5UuJxM2bsXw2bhhOEewt4o5Z.fuFJ.BqyO0Gt6t6HgDR.SbhSTq88ge3GhnhJJ89NAzm3esqcMjXhIxZ43i+3OVuhioDeKI9dHfT2yeABDfwMtwg4O+4q0i8BW3B3AO3AngMrgVrxg0l058+abiafKe4KWqs0rl0Lz6G0jYbE+bxIG7i+3OhScpSg+4e9Gjd5oihJpHnToR3s2di.BH.z912dzqd0KLnAMn5cVdrtrU96+5FeFFFb8qecb9yedbtycNbkqbEjd5oiLyLS8ZFpzau8FsqcsC8nG8.8qe8Cu3K9hvWe8UuiOajJUJN3AOXshu.ABP+6e+Qe6ae0iif1Lj3etycNbzidzZs1m3gGdf+2+6+A+7yOyR7evCd.N9wONN6YOKtxUtBjISFxM2bQokVJToRU0S43st0sFcoKcA8t28FO2y8bF82Iv04eEUTgVqgIt3hKnksrkFUbzfggAEWbwnnhJBt4lanIMoIrFeqEg..2NmrX3S0L9EWbwL.f0+cjibjpebJUpjoKcoKr93V+5WuQGe1DczQyZbhM1Xq0ia1yd1bV1Mk3yvvv71u8ay4wd1yd10+IoN7O2JMNO1e3G9glzwVeT2y+adyaxY44a+1u0nhgtd8ahSdxliSCil03yeO4S9jZcdKPf.l7yOeVi+oO8oYhN5nYDJTHmutw1+5ZW6JyF1vFXTnPgdW1Ljyec89XUUUkdebXK9UTQELG5PGhIlXhgogMrgFz4c88O2c2clXhIFlabiaXzm+idzil0icaaaaMpyaCM9gEVXrF+ssssYRw+VYmIyO9i+HyfG7fYb0UWM3Wac0UWYF1vFFyoO8oMp3y14ejQFIqwZ0qd058w8gO7gLImbxLwFarLCX.CfIf.BfQf.A053c7iebqxm+0E99l.MJBEJDKlidMdBIj.JqLySua+bm6bH4jSVqs6qu9hO3C9.yRLH0VaZSaP6ZW6Xcem3DmvJWZbLv1mGXdzciTSYlYl3UdkWAQDQDH4jS1fWOFtxUtBlxTlB5ZW6pc0Tk8t10tPiabiwPG5PQhIlnYexmphJp.IlXhHzPCEKe4K2nNF8qe8i0seyadSbgKbASo3UujJUJRM0T0Z6t4la34e9m2nOtm6bmCC64FDdgW3EvQNxQPUUUkAeLppppvAO3AQDQDAhN5n0qUez5CWMii9z7Nm7jmDiXDi.96u+H5niFqXEq.G6XGCYmc1ZsxwxWSk80jcYB...CaXCCO8S+zZs8LyLSrpUsJyRL3ZRn4ce22E96u+lkXPzVjQFIqa+u+6+15VPbvoPghp++G+3GGgGd33a+1u0jOtW+5WG8t28Fqd0q1jOVVCm5TmBEUTQV73TQEUf29seaiZXKOpQMJ3latw5916d2qoVzzosrksv51GwHFAZbiarAe7TpTI9fO3CvS+zOMtxktb8+DzSG3.G.gFZn3Lm4Llsio95XG6Xn6cu6HxHiDe+2+8lsaB0RytMA..v43xeoKconf5LTAMTZZ6y5poMsorNeDPLeXKwN.02gYcyhlX7TpTI.TOLKGzfFjd2A1zGJTn.u4a9llb+jwQzRW5Rw28cemA8bZXCaHdwW7EYcee629sVrOWTYkUhctycx599e+u+mAe7Ju7xwvF1vvm9oepdUl8zSOQqZUqPaZSaf2d6c893yKu7vy9rOqUq1Bu+8uOFyXFCF3.GH9y+7OsJwzbxtNAf9zm9fgLjgn01kKWNmMQf9PkJUHt3hi088QezGgFz.cOrxHllN24Ny51e3CeHt8susUtz33RgBEH4j1OF+3Ge0ICng.ABPe6aewm8YeFtvEt.xLyLgBEJPkUVIt28tGN9wONhO93QG6XG0YLhO93w5W+5sjmFVTMrgMDCYHCAu268dXiabi3jm7j3+9u+CYmc13gO7gPgBEPtb43d26d3rm8rXSaZSXhSbhbNyVpwrl0rL36Rb7ie7rt8LxHCb1ydVC5XouNzgNDxO+70Z6cricjyZpiKJTn.CaXCC+3O9ib9XZTiZDl4LmINzgNDJrvBQokVJRO8zwMu4MQwEWLJt3hwANvAvjm7jgmdx9nXphJp.QGcz35W+5FT4yPcwKdQ7DOwSfcsqcYTOe2c2cybIxHv2cBAioS.VSW5RWh0NqjGd3ASFYjgAEeM1111Fmc3lJqrRVONTm.z3v14ut96fe8W+UCNFN6cBPt5vrqcsqk0Nd0fG7fY9q+5uz6i+AO3AYZaaaKmuF6latw72+8ey5y0VnS.NsoMsZ0g8dwW7EYV25VGyUtxUXToRkQcbKu7xYRHgDXbyM23rLut0sNC57uhJpfyNn3a9luoQUNqu3+hu3KxZ7VwJVgAGqYLiYnyNJYbwEGib4x06imLYxXF9vGNmGyt0stw42WqAam+b84k3iO9peL+vO7CLd4kW0amTrwMtwLCbfCjYxSdxLKXAKfYYKaYLqYMqgYaaaaLkVZo7dm.ztOA.FFFlwO9wy5yYRSZRFT7YXT+grfCNXVOd6d26lyiCk.fwgqyet9htcsqcYvwfR.f8uPqt8JYO8zSlDSLQiJFEUTQLCcnCkyWm6ZW6JqiN.agD.N8oOMyjlzjX1yd1CSQEUjQcb3xu7K+BiKt3Bqk4m5odJC98+ZlrRM+WyZVyXTpToAW9zU7yJqrXsr6omdx7fG7.CJNG8nGky26DKVLSJojhAW10XNyYNbdr+pu5qz4y0XR.32+8emwSO8jyX1qd0Klu5q9JlzRKs5sry2W+0ttI.z3i+3Ol0pSYqacq3ZW6ZFzwZcqacPlLYZs8G+web7JuxqXrEQhAJf.XeFHjsEiIhwgoFsAaSZRSv4N24vDlvDLpikO93CRJojvfFzfXc+W4JWAey27MF0w1RqO8oOXSaZS3UdkWA93iOl0i8.Fv.3bED8bm6bn.CbDGvUy.jUVYwZeVxTr8su8Z0QQ0XTiZTFzX+WgBEbNKd5t6tie8W+UNGkC5iUrhUfwMtww5993O9iMqcHu6d26hgLjgv5wbHCYH3hW7h3rm8rXlyblnssssls3Zo3Pj.PPAEDl1zllVaWSuMUeUbwEiO4S9DV22RVxRf.ABL5xHwvzzl1TV2t4dHZQ.ZPCZ.9ge3GPngFpIcbb0UWwd1ydPyadyYc+KdwKl0Kn3nalyblrlXACCC9KCbH70qd0KDRHgv59L2iF.t58+ScpS0fNN6bm6D27l2j088dy6CM3IPJ1rhUrBznF0Hs1dt4lK1yd1iIe70XJSYJZ8cPADP.3fG7f3PG5PlkyEqIGhD..TOK.x1GxRN4jw4N24zqiwxV1xXsmP+LOyyfm64dNStLRzeb0ieYaJYlXZV25VGdxm7IMKGKIRjfu3K9BV2WFYjAqyqFN5DKVLmcXtqeUCqFJA.m2saRIkjYKAqye9yyZsmFd3gid0qdYPGqUrhUv516d26Nl3jeCip7UWMpQMh0YPT.fMsoMYVhwN1wNvQNxQp01d7G+wwe9m+IF5PGpYIFVaNLI.3u+9i28ceWV2GWim+ZJmbxgyIoCiY49kXZ7vCOXc6TB.lWOQO5NmWPwX8JuxqfN0oNw591912tYMV1K5QO5Aqa+1bbmw5x3F23Xs1HyM2bMaC+Mtt6eCcn+8O+y+v5jHD.va8VukYsVUGyXFCb0UW0Z6m8rmE4jSNl7wut0hQXgEFNwINAZQKZgIer4KNLI..n9OnXqpiO0oNE9ge3Gz4ycgKbgnDVVMBeoW5kP26d2MakQh9gqgHCk.f40LmybL6GSABDfoLkov5994e9mY8yYN535hD4jigOav05V25pWGGpKyQy.Td4kyZ0l6s2diwLlwXPGq8su8w51adyaNdoW5kLpxGW72e+wfG7f0Z6pToB+7O+yl8X8i+3OBIRjXVOtVaNTI.zfFz.NqFn3hKNNmZSu4MuI1vF1fVa2EWbgy9D.wxhgiIIDCYIeknaRjHA8ouQXQN1b0gYKu7xwu8a+lEIl1x3ZdA3ArLF60GbUqMe+2+8F0TpacOFEVn1qO8u1q8ZFbmjjqZjXvCdvVjOKyUmIzbOOI7Mey2vYecwdhCUB..p6jFr06Ku7kuLmynUye9ym0OzLoIMINWdZIVVUTQErtcahIOCGD8oO8AtvRUlZNzrl0LN6TgNiI.3kWdw51M1dn9nF0nX8yBETPA3nG8nF0wTCyUm+qxJqDm+7mm08YnShP5qt0stw51MmyReCX.C.QGczlsiGexgKA.Wc0UrvEtPV22G8QeDprxJq01t5U9GVqtKO8zSDe7waQJij5GWI.vUeCfX3rzscIWcVLZMc3+Wkb7240GIRjvYGOyTZFfLxHCb7iebs1dO5QOL3d39+8e+GmeN1XWBiqOgGd3rt8+8e+WyVLbjVH3bHqO0QO5QiO6y9LHUpzZscYxjg0t10h4Ti18bIKbgrVcyyd1y1gnJdrWUZokx5145NoHFNMqG4VJbcACCct4vVjBEJP5omNxHiLPd4kGxO+7wCe3CQkUVIprxJ0p4FSKszX83nTkRV2t9Xbiabr1F6G3.G.kWd4FUxxacqak0lJ0Pu6e.tee1CO7.spUsxfOd5CIRj.O7vCs5qPEVXgH2by0nV7hpo10t1g92+9aRGCaINjI.HPf.rjkrDVWpJ+jO4Svq+5uN7wGevINwIvoS4jZ8X7yO+zqQN.wxgqElFS8Cvj+eBEZYq.PtlHTRO8zgBEJrq5OG23F2.G8nGEm+7mG+4e9m3l27lZs9IXsM3AOX3u+9i7xKuZs8hKtXbjibDL7gObC9XlXhIp01jHQBF8nGsAerXaBUC.nksrkF7wxP3me9w5xBb1YmsI+8GiXDivjd91Zb3ZB.MFzfFDqYpkWd4gO+y+b..NWVNiKt3r66cm163JA.tlg.I1dBJnfXc6pToxrtxCZojQFYfEtvEh10t1gN1wNhYO6Yicsqcg+8e+Wd+h+.patSttvrwL42b5SeZVmvdF+3GOmK7N5BWC8t.CLPC9XYH3ZVJzb72bOyy7Ll7wvVh8SJ3Fgkrjkfd1ydp01W9xWNZbiaLt.KyBWsrksDu4a9lVihGgCJTnfR.vA.ayLaZjat4hl0rlYEKM5u6d26hErfEfssssYx8ndKswMtwgUu5Uq01O7gOLd3CenAsxkZtF6+Zb+6y9Pb7W+0ekWlUUKpnhL4ig4ZByxVgCaM..ntiqLxQNRs19Ce3Cwrl0rX84rfEr.pilwyt8suMmynYbcWkDaO5ZIw0Vct.X8qe8nyctyXSaZS17W7GP82w0gNzAs1dokVJN7gOrdebd3CeH9tu66zZ6QDQDbt7bWe3pe7vW3pCIpu7yO+PCaXCMSkFaCNzI..ntM+EIRjd8X6XG6HhIlXrrEHR8hqdrqXwhs3seHw7wEWbgy9Yfo9kwlaJUpDu9q+5XpScpn3hKVmOVM8.+O5i9Hr6cua76+9uiadyahBJn.Td4kCUpTAFFlZ8u5NExZNw0bBfgLZ.9tu66XMoLioy+ogs16w0cDfYnbD+tGG5l...nCcnCXRSZR50JQ1hW7h06jEHVNW4JWg0s2ktzEqbIgXpDIRDq8pbaoEEHFFFLgILANmmP.TO+S7Zu1qgwMtwg90u9Yw6.kFhwN1wh4O+4q0nY5HG4HnnhJB95qu06wfsp+2e+82jls9rkdOF.l7cuatWoHsE3vm...P7wGO1wN1gNmzM5YO6oQ0qYIlem4Lmg0sGVXgYkKIDSEWUitszD5zm8YelNu3+q9puJ97O+ysYmy2CJnfPe6aewIOYsGQSkWd43.G3.06Z8vst0svoO8o0Z6SbhSDt4laFc4hqmqDIRp90xJUn.tYEFMHhEKFO0S8TlzwvQrogcJR.nEsnEXVyZVXoKcob9Xz09HVOLLL32+8em08Yol7PHVF5ZcavV4KSS+12lyoObWbwErgMrALwINQqboxvMtwMNsR..Pcy.TeI.jXhIpUsGHPf.ity+oAWuGOvANP7se62B..Y2OaDbSrO5XuNhKG71N0ikE1bm6b4rWGO7gObNmCoIVWm+7mG4yw7iti1PvwQGWuOBX5UGq4xxW5myYsTjXhIZ1t3uktSO9xu7Ky5Eb+4e9mQAET.mOOUpTgst0sp01Gv.F.myiC5Kt5DnliUlOh4gSSB.RjHA28t2EkUVY05eW+Nxv92+946hG4QRJojXc6O1i8XV7YtNh4kt9hdaggy48u+8wOxQOkOlXhwfW46zEK87dfu95KhJpnzZ6UUUU5762N6u8a3N24NZscSoy+oAW2vEk.fsCg..ruF4Y4opN+zRSnPgvCO7n5+4lGd.2c2cmlyethOeotm+JUpjydtLWqtblyxg0Fe+9ulJ80REetl9a8yO+f2d6Mue9enCeXnfk69WjHQHgDRvrFKck.f4572PGM.p.v2sas2WyZVyvvF1vL4xCW8YBMyRe786+T7eTB.EVYYV8BgpGEWJ97e74Crc9mTRIgLxHCsdrBDHvrd2X0Ee+5OeDe..4kTrEM9bMWv2ktzEd+7WE.NdJ+Jq6KhHhvrOW0mZpox49LWm+CZPCh0ZI6Dm3DZk.hJ.jQt4fi9i+nVO9W+0ecyxzzLWye.EUTQ3pW+5796+T7KScm.rP4EhBg1q+yVKZheoO7gb9XxQdAP18y1hFeSQQ5XRun9J20W7KpTteconRK0x85xCKwhcrqUbjWHjyHGKbweBq6uGO0SA3kGFcYQWu9oI91B+8ukRkbLbrt6ip5WKU7S4zmh0s251EBtSMduTeiutdeL86mMDYfWz5etL6C2zNGVnl0+tWoRk3XG+Xbtey4q+uXTQgsTmg7rRkJwFRbKXLSX70Z66d66PqNpoPgBwfGQzlkyeeaJ2y69G7H+.F8iRp2V6yeb84kxprRKx2Gxmm+t..HVhXH1MOspcH.MYfTn7BqN9kpiNJSSk3mYs2hxV7Mkyee0wpTGakaCI995E2Smm95kWF0qKZhutR5RbC71h0Ccq64ex6Zu3JodIVerI7QejIUNz0qe.1N+8ukJ9bMLqxJyLAfk47uxJqD+44+CV22K7bCBspIAXvm+558wfZR.FzcspB.4wQ0x2410dy5e2e1ydVTTgbOMzZNe8eF+u+mVI...7K+vOhO7ceup+cU.X+rLy+8BuvKfm9weByPIA.MI.zktzE7O+y+n0ttpzKAwyX5Vk+9mM55yeb84EOcyMy1eWXM+7uthuP.X0CNf51dPrapWfIn3yuwmOTy3WdAEg33XgY5IexmDCZPCxhVV36W+4i3C.bgy+GPdAEXQh+wN1wXsmuKTnPz+92ed+7WH.pPGCSQyoUtxUpy8aNO+ehm3IXsp2O8oOcsVg792qecVSPybz4+poALfAv51OPxICgUn9NscF+7msR7Ep4W3CBqyOo3yOwmuHDpqdxw7puJm8LXqw7y.e+5OeEeEJTfib3evhD+MsoMw51iHhHPSaZSA.+e9y0J94CdvCLaw3pW8pXe6ae57wXtO+Yqy.pRkpZMW+y1L+WPAEDF7fGrYsrDczQy51KpnhvVeTYvY8ye1BwmuuF.wIlJUpPbu86fe8WYuyXMgILAZr+ag8kKe4l8EskqcsqgjSNYV22XG6XMqwxTv0ZC+ku7kMKGeUpTgXiMVVmJjsjFyXFCqSUwZFM.JUpDae6aWq8O4IOYy9Tbb+5W+3rCUtpUsJSd94mXZnD.H7hJqrRLoIMI7c6l80s7VzhVfu3K9Bqbox4S1YlEhO93MqGy25sdKVunWiabisoR.fqUVxTRIEyxJAXBIj.94e9mM4iigJv.CDQFYjZs8yd1yh6bm6fidziVqlC..vUWcEu9q+5l8xh.ABvLlwLXce25V2BKNgO1rGSh9iR.fX0ISlLzm9zGVmAx.TOEh98e+2qy0Sdh4yxV1xvF23FMKGq0rl0fe5m9IV22a8VukMyT.L.vy9rOKqaO2byE6YOrmXp95a+1uEKZvPVng...H.jDQAQUQKxjNFlB1ZF.FFF7se62xZ0+GUTQYwlbllwLlA72e+YceaciaBG7fGzhDWR8iR.fX0TVYkgDRHAzktzEbgKbAVeLBEJDaZSaBcu6c2JW5btM0oNUSNIfCdvCh4Lm4v59ZcqaMhM1XMoiu4lt5boycty0nm89V9xWNd0W8UqUsf7DOgYpm0qmF4HGI7hkQlz5W+5Y8Btl579utzfFz.74e9my49G0nFE10t1kEK9DtQI.Pr3RKszv6+9uOBLv.wBVvB3rMmcwEWv1291wq8ZulUtDRTpTIl7jmLd8W+0wC0wPCkKe4W9kXjibjrtDvpIoNaoU.P.fV0pVg9O.1qEfLyLSLrgMLctdFTWokVZ3ke4WFu8a+105h+hEKVmq1fVB93iOr1A7RKszzpc2aW6ZGm0Fh4RLwDCdwW7EYceUTQEXLiYLHt3hyn9aO1biabC74e9ma15OGNpnD.Hb5rm8r3PG5PH6r0+I+BFFFbqacKru8sO7tu66htzktf10t1gO6y9Lc9kohEKFIkTRzE+shlzjlDZZypc09t4MuYz5V2ZrrksLTXg5dxIgggAG6XGC8t28Fyd1yly0+84O+4i92+9a1J2lSy4ceWN224N24P25V2vt10t3rOATVYkgibjif23MdCz4N2Ys5w+BEJr5WSs1puUAPMlxTlhUYktam6bmbN6.B.rjkrDDbvAiktzkZPIdAntCWdwKdQ7Ye1mgm3IdBzwN1Q7du26gku7kapEaGZNEKGvDiyINwIvINwI.f56nHnfBB93iOvau8Fd6s2vCO7.UVYknrxJCEWbw3t28t3d26dFbO68IexmD6cu6EsoMswRbZP3PfAFH17N1AFyHeIHWt7p2dt4lKd228cQbwEG5Uu5EhHhHP.AD.ZbiaLTnPAxImbvUtxUvwO9wwcu6c0YLd8W+0wBVvBrvmIFuPCOLL8oOcr10tVV2+ctycvXFyXvzl1zPu6cuQ.AD.XXXv8u+8w8u+8wUtxUz4xd7pV0pvHFwHfRkJsTmBbZfCbfHf.BPmIv6latY0VtiEKVL9ke4Wv.G3.wUu5UY8wjWd4g4N24h3hKNDVXggm4YdFzktzEznF0HznF0H3iO9fRJoDTbwEi6cu6gqe8qiqd0qhyd1yx5pdn4nyb5HiR.fnWJt3hwUtB6ScpFK+7yOLy2JVL+2etvUWc0rdrI5mN20tfTRIE77O+yq0EJTnPA9se62vu8a+lQcrm0rlEVwJVg4nXZQshUrBbwKdQbtycNNeLEUTQ3HG4H58wzUWcEqacqq5dVuHQhL4xogRjHQ30dsWSm2E7KLzgXU6rsMu4MGm5TmBiabiSmudxvv.oRkBoRkZ0JaNinl.fX00nF0HL24NW7e+2+gIMkISW7mmEVXggKdwKZ1ZGXu7xKrgMrArpUsJy93J2RvM2bC+3O9ilsy+10t1gSbhSn0vpiOdsn9ZFfwLgIXkJI++ZTiZD9ge3GvpW8p4bxXxbwZzzF1yr8+zIwgfat4FF3.GH17l2Lt6cuK9zO8Sog4mMjl0rlge4W9Er8sucNGe75iQLhQfKcoKgIO4IaFKcVd94me3m9oeBevG7AvSOMtoH6F23FiEtvEhKcoKg9zm9n094iZAH7vCGcsqck0800t1U7j8rGV4RjZZle.R47mCwGe7nYMqYl8Xzrl0LLjgLDy9w0QhMUB.d5omr9kOd4kWHv.CjGJQ5u1291yZF9cnCcvhcrEJTHZe6auIcrc2c24bFQyT3iO9f9129hXiMV7ce22gbyMW7y+7OiINwIZ0GK3550uV2VpeGng.ABvXG6XwMu4Mw92+9wHFwHfXwhq2mWKaYKwLlwLvku7kQRIkDZaaaqEo7w06igDRHlkkuVWbwE7IexmfzRKMDarwpWcbOu81aL7gObjXhIh6bm6f4Mu4w4ee2ktzEs1VaCoclb4t9L7gObV2tkbn+ouDKQLVvBV.RO8zwQNxQvzm9zQm6bmM3ZKwM2bCgFZnXLiYL3q9puB+y+7OHyLyDuxq7JFbYpicriFz1smI314jEikZEeSeH69YawVw4n3qewuU92Djc1Yi6cu6g6d26h7yOeTZokhxJqLTd4kCFFFVetBEJDt6t6vSO8Dd5omve+8GAFXfHv.CDMoIMQup9MagyeG8320t1UVWQ1hO93QLSep5L9JUpDW+5WGW+5WGYkUVn3hKFLLLvau8FAFXfnqcsqncsy3uHls9q++6+9u3JW4J392+9H+7yGt4lavGe7AMqYMCcpScBssss0jtydqw4eO6YOwe7G0dg+wKu7BYlYlnfJJyl70+G9vGhabiafLxHCjUVYgG9vGhxJqLHPf.3gGdT822DP.Afl27lifCNXiJIPa8+9yRi5DfDHTnPz7l2bz7l2bZB3gTKhDIBcoKcg06d0YP6ae6M4ZYiO86+9uq0E+A.F8nGMDKVLJ39kwCkp5WCZPCP25V2P25V236hhCMapl.fPHDh4CWKEwl6k8Wh8IJA.BgPb.kd5oi8u+8q016V25FUSeD.PI.PHDhCou5q9JVm.hn69mnAk..gPHNXJojRXcwcxWe8kltsIUiR.fPHDGLaYKag00xgwN1whFzfFvCkHhsHJA.BgPbfnRkJrpUsJV2GU8+jZhR.fPHDGHG5PGB27l2Tqs+TO0SgG6wdLdnDQrUQI.PHDhCDtV.ln69mTWTB.DBg3fPpTo3jm7jZs8F1vFhQMpQwCkHhsLJA.BgPbPv0c+OgILAq9ZvAw1Gk..gPHN.xN6rwd1ydXce1BK7ODaOTB.DBg3.XMqYMnxJqTqs2+92eyxpRJwwCk..gPH14Ju7xw5W+5YceTm+ivEg..p3ofqpN+jhOEeJ9VOZVjmcVO+cjh+N1wNPt4lqVauoMsoX3Ce3V73aLn3y+wWH.PgUVlUuPn5QwkhOEeJ9V+3C.TgRE7V746yeGs3u5UuZV29Dm3Dgqt5pEO9FJJ91Fw2E.fBkWHJDZOsQZsPwmhOEeKW7aUqCF+y+7O0ZahDIBAz7laUhe8ghuoGegrbQduZPCvPd4QBY2OaKd7MET74u3K314jEiXIhgX27zp1g.zjARgxKDT7o3SwmhOEeJ9T7stwWH.r5AGPcaOH1MOAEeJ9T7o3SwmhOEeqe7Ep4W3CBqyOo3SwmhOEeJ9T7o3achOML.IDBgPbBQI.PHDBg3DhR.fPHDBwIDk..gPHDhSHJA.BgPHDmPTB.DBgPHNgnD.HDBgPbBQI.PHDBg3DhR.fPHDBwIDk..gPHDhSHJA.BgPHDmPTB.DBgPHNgnD.HDBgPbBQI.PHDBg3DhR.fPHDBwIDk..gPHDhSHW36B.gPHDtIWtbHUpT..bxSdRNebhEKFgGd3..H3fCFAGbvVihGwNFk..gPH1PjJUJNvAN.t80tN7FLPr6dh99nKrO4G+IfDu8l0mWpokFJ5uSE..eyV1J..xnvBfD+8GMJv.QPAEDBO7vqNIABgR.fPHDdlToRQhabSPQd4hPCp0Xx8t2PRD8yfNFgERHU++iHrvzZ+mN0TwurwMgMlWtPjDIn0crin8g9XH3mI.St7SrOQI.PHDBOYe6cu3Rm7znOssc38dtAw4c2aNDQXgUqDCRO6rwg2ex3HadKnDWcEQEUTH5ni1hEehsGJA.BgPrxRLwDwIRNYLl90eL8oOSdoLDT.AfYLhQB..4kTB9sTSEiaiaDtz3FiILgIfHiLRdobQrdnQA.gPHVIxjICwL5WEdkw8vWOq4vZU0yGj3s2XH8t2X8u06fOY3iD+6QNJhZ.CDqbkqDxkKmuKdDKDpF.HDBwJXkqbkHsS+aXwSHFKZU8apj3s2XrCZPXrCZPH0zRCu4nGMboYMCwGe7zHKvACk..gPHVPxkKGyYluIdgNzQLkYT6p6O0zRC+1kREomUVvu.aI..JQf.HQhD..TPt4AebQj5+eF2EA0rlg9DZX0pC+YIEVHgf0+dyExKoDrl3S.OzGuQzuzHolGvAAk..gPHVHxkKGy5MdCLsm64q9h1mN0TwgN+YgK92XzxNDBd424s066rVpToPpToXu6OIjuraiH5xiggz6dawqQAId6M9vILA0IBrkshD23lvBVzBoZDvNGk..gPHV.RkJEydxSF6d9wCId6M1wQOJ10ISAwL0+GVzW+0PhDIP18yFA2D8eX3U833OlX..PJojB9r8kDTjWtXLOy.r30LPsRDH9DPlBA0z.1wbA.PE3mdCnpZ7SJ9T7o3Sw2QI907h+omc1Xt+3gwHhIFjxR+TyZ7iLxHQjQFIjKWNV0pVE9zcsCLinFtEuyEpIQfzyNaL+YNSDR26NhO93Mnigi76+1KwWH.PgUVV0EFqYvKrxx.EeJ9T7o36HEe4xkikunEgcO+3wZRJI7yYcOrsjStViwdyc7kHQBhO93w1RNYbthji2aCeMjWRIl3Qs9ET.Af0+VuC5kuRPj85oPJojhd87bje+2dJ9BtcNYwXkiMgPHNjJpvhv6OsoikOo2.u65WGFWryF87oeZqd43tYjA9xk7YX.sIDL1AMHqVb+jstUjsGthY+NuC7UruVs3RLNBtcNYwHVhXH1MOspUCglLPJTdgfhOEeJ9T7cDh+bl4ahA21PvNOyowWtwMVcu42ZE+5JwDSDGee6CKcJS0pMzCSMszvR918hXm2Gx4nEvQ88e6s3KD.V8fCntsGD6lmfhOEeJ9T7cDhehIlHZAP8dweKU7YSLwDCd6EsHL2skHRMszrPQo1BKjPvt+fOD66qVMRHgDX8w3H99u8X7Ep4W3CBqyOo3SwmhOEe6w3KSlLr+DSDWN6rp2K9aIhutDd3giubiaDwsssZ0RB..3ylwLU22.5SDrNaB5H89u8Z7ooBXBgPLQyYluIJ7gOTuu3u0lDIRPJ+1owduTpV0j.hHrvvtdu2GQMvAp2cPPh0Ck..gPHlfDSLQH8O+Srpu4arIu3eMsxU+UXoG7.V0j.j3s23HK8ywlVxRPhIlnUKtj5Gk..gPHFI4xkiXiMVLwoMU0SPO1ARbGaGKc+IYUFlf0z5eu4hJu1MvDm3DspwkvMJA.BgPLRqZUqBAGbvF7jfCeRhDIHw8raL0kuLqdrG6fFDFcngiXF63nUYPa.TB.DBgXDjKWNV4JWI1xV1BeWTLXRjHAu0BV.9jstUqdriHrvv+qu8CQOjghhJrHqd7I++nD.HDBwHrpUsJDSLwX2T0+0UjQFIx1CWsp8G.MBKjPvmN9IfoNtwS0D.OhR.fPHDiPhIlncUU+ylY+NuC9zcsCdI1gERHXeev7vrdi2fRBfmPI.PHDhAJwDSDwDSL1785+5iuh8EiHlXvoSMUdI9R71arjwGCkD.OgR.fPHDCzpV0pvrm8r46hgYQLwDC14I+UdK9R71aLsm64QzCYnTR.VYTB.DBgX.jJUJBO7vs6u6+Z5YhNZdou.ngl9DPzCYn7VYvYDk..gPHFfst0s5vb2+ZDczQi0t+8wqkAMIALmY9l7Z4vYBk..gPHF.M0.fiDIRjfFER636hABKjPPmaf2btHBQLunD.HDBQOISlLDUTQw2ECKhvexmfWaF.MF6fFDp7VxnoMXq.JA.BgPzSImbxbtF2auKxHiDG9LmguKF..3CmvDvw229fToR46hhCMJA.BgPzSomd5NbU+uFAGbv3N4mKeWLp1RmxTwBlabzHCvBhR.fPHD8jiVm+qtBNjP36hP0j3s238GwHQrwFKeWTbXQI.PHDhdJ3fCluKBVTEUd47cQnVzzo.SN4j46hhCIJA.BgPH..ngMqY7cQPKyXDiDadkqjZJ.K.JA.BgPH1zV5TlJM+.XAPI.PHDBA..OHqr36h.qBJf.PKD4BRIkT36hhCEJA.BgPH..vWO7fuKBb5CmvDvBlab7cwvgBk..gPHD..TP1Yy2EAcJtWYzXkqbk7cwvgAk..gPHDHSlLDj+MluKF5TDgEFNQxIScHPyDJA.BgPHH4jSF8Izv36hQ8ZFQMbrpUsJ9tX3PfR.fPHDBjdtyivrglHf3RDgEF9qe8WoZAvLfR.fPHDmbxjICsvca2N.XcMinFNsXAYFHD.PEOEbU04mT7o3SwmhOEeqe7W4x9BLiQNRdpjX3hHrvvEMwgDnszq+7U7EB.TXkkY0KDpdTbo3SwmhOEeJ97W7ux+cczfhKAR71aqbovzzmNzIidJB1V50e9L9BtcNYwXkiMgPHDaDScbS.adFuocWB...wrt0fOaMeEeWLra4B.fXIhgX27zp1g.zjARgxKjhOEeGp3WyYqLYxjgzSO8Zs+GjUVvWO7.JUoBJTp.tHxEHRn5nKWtbvTbIPr29TuwovJJC9EP.bt+hJubsla2CKrvfDIR.C.dnhJQWCMTGtW+o3q+weSqeCXR8ou1kW7G.v8hKFRbyCHQhDC54Yq75OeGe0I.XkCNf51dPradhBQgT7o3ayGeYxjAYxjA4xkiTSMU.7+egb.fBx3tUeQ6vBIDH9QegZGZPCvnhneVpSCC1oSMUTATmPRokTB9lsu6p2WQBXfDIRPgkTBD4iOPhDIPrXwH7vCG..QFYjlsxg816+NhwW1UuAt0o+cL8oNMqbzMeFZui.ImbxHlXhwfdd1Bu9aKDeWz7K7Ag04mT7o3ymwOkTRo5KvWPt4AebQDjmWdvWQtBI93MBssg.OAv6ZCcAcCUDgU6w48P5cu04iO8ryF24uSEEVRI3C2xVAv+ehBEqPI7qw9ifBJHDbvAivCObC5Nwr0d+2YJ9xkKGK3cdWrtYMadH5lOCo28FSeyaxfS..v498eMw0EdJ1DBuPycxexSdRHWtb3ZkUfRy+APr6dV8ctaOeAdysfBH.DziZlAtRVH0zRCE82ohOeKaEEVRwvu.aY0M+fwlb.wxQtb4XVuwaf0MqYa2V0+0j2JphuKB1snD.HNrRIkTfLYxPpolJ7lgAEjc1HH+aLBssgfI+3OgCwW9YKPyjGScqcAf5jbvi5yBkHP.BJnfP3gGNZXKZNPS3teLPLuzbw+kL9XbX96+PCp0PpToU2TUD8Gk..wgfToRgToRQpolJTTPAfo3RPngzN7XsssXTCMJ9t34zhqjCzzzB6cKaEeixpf.O7.MJv.QXgEFBO7vQvAGLOTZcrIUpTr7EsHGpK9C.7XsssHkTRgR.vHPI.Pr6HWtbHUpTbxSdRjeFY.UEHmtXucFMMsPcSL3zolJ9ticbjdVYA+BrknDABpNo.5K3MdImbxHoMtQrzoLUGpK9CnNIyu8PGfuKF1knD.H17jKWNRIkTvIO4IghBJ.9xH.8M7vUWM9T606PIhvBSqjBRMszvurwMgMlWtPn2dWcMEDYjQR8qf5gb4xQBIj.ZdUJv5eq2guKNVLdyPSmMFCJA.hMojSNYstf+mP2cuSovBIjZsH0HujRvku4Mwm+8whhTVEDIwOD9S9DTsDTGojRJXEK5SvbG0qXWrH+XJjmWd7cQvtDk..wlfToRQJojBt0UtBTUfbz2veb5B9DVIwau0plBRMszver68hMtjk.QRjfV2wNhHiLRmxDBjISFV4x9BzB.r6O3C46hiUguhbkuKB1knD.H7ljSNYb3CeX3Y4kiGqEAhAEVXHnWy46KrIlt5VKAomc13zNYIDHWtbrpUsJj1YOKV5zmoCWa8SL+nD.HVMxkKGImbx3uO24vCjICCs2Qfu70FKeWrHNfp47W.f1ID738pWpmYC8x9YIvkKxjICIjPBPQVYgOX7wffn9ECQOQI.Prnp4E8UladXLC54wnF0n46hEwIScSHH0zRCe2x9Bbq7yCk6gGHpnhxtqSElbxIie8m9I3cYUfOYjijtiehAiR.fX1o4h9R+6+FLUo.i6kdY7JcnyforR46hFg..saxfSmZpXda+MfP+jf1z0tZy1bARkJEacqaEJxMWDQG5D9TJYZhIfR.fX1jXhIV8E8G+qMF7Z8+Ygp7e.TIu.5h+DaZ0rSEld1YiCuwMgMIu.3RiaL5W+5GhN5n4sxVMun+i0h.w61+mkta+5nvRJluKB1knD.HlDoRkhslXhPUUJP+5cevxl2GAk4mOTlW9PwMuIeW7HDCVPAD.lwHFY0+9gOyYvL2ydptuCDczQaQap.YxjgTRIEjxwNN7VQUHzfZMcQ+5geA1R9tHXWhR.fXvjKWNRLwDwIOwIvvF7Kh48VuK7UjPnLu7QkW9x7cwiPLqFRu6c0KDRolVZXdu9afRb0UDdu5IhN5nMoos3hJrHjxUuNN4IOIdPVYAkxkif7uwnOgFFF0jdcyzYfiuhJub9tHXWhR.fn2RIkTvARNYnpxpvrl1LvaNo2.JyKOn3N2AUUYE7cwiPr3T22AlI.T2TAe2x9Bb4ryBcqO8odSFPyhSU5omNxOiL.S4kCeE4ZMlUKo6v2Xjd1YiV2wNx2EC6RTB.DcRyc6K8utH52S2arrOdQfQoRnLmbPE+8eCnTIeWDIDdQMapfZlLPaerGC..4mQFPr2diBx3tPr29fvBIDzgl1TLJZX5YVc5TSEQ9puBeWLrKQI.PXkLYxvpV4JgppTfYM0oi2bRuAXpnBT0skAU4SS6lDRMU2jAN7ueFj1cuKBLj1gWajuTsFBhDyqKeuLvTrAGwF1CnD.H0RxImLNv2+8HzN0ELu25cgDIhgphKFUk1MgJ4Ev2EOBwlGaICbJo+MFZui.Co28l5LelQxKoD3RiaLeWLraQI.P.f5gvWJG+DneOcuwF+p0...UEWLp7F2.LESCwFBwXnIYfYLhQhTSKMr3slH..BMj1gwNnAwuENG.qIojvrSHd9tXX2hR.vIlb4xwpV1WfaesafYM0ogMsl0B.0W3WQlYRW3mPLipYGH7vm4L38VypwLnlGvnIujRvC8waSZTX3riR.vIjlEMjGb+bwrl5zQvA0J.PW3mPrVp4PKjXbV6ARFyY9yiuKF10nD.bhPW3mPHNBNcpoBWaUfzc+ahnD.bBv0E9YpnBTkLYzE9IDhcC4kTB184OGRbO6luKJ18nD.bfoqK7qHyrngyGgPr6LsubUXq66636hgCAJA.GPbdg+GMA9nLyL44RHgPHFt2aCeMRXYetc0x1rsLJA.GLZFNeiezuJ5WDQT81UlWdPQFYPybeDBwti7RJASc4KCe7JWoM4xzr8JW..TA.g7PvUUieRw2zjRJofUshUf2bJSs5gyGvi5fe2ICZ43kvKDJwOHpoMAJyKepImHFkTSKMrte9mvWlXhl0N8miz2+arw2E.fBqrLH1MOspEBUOJtT7Ms3KSlLD6blCF1fFL1212Y0amohJfhLtKM68Q3MB7zK3ZHsE..B8wGnzGugBYx32BEwtxZ1eRnDIhwWtwMZVq1eGku+2TiufamSVLVw3RLSJpvhvpV1xPKaXiwrl1zgDIhqdeJxLSnLmbnp6mvqD07lCWZdyq01TjQFp+aSBQGRMszvWc3CfnlzDQOe5mluKNNrbA.PrDw7VFHEJuPJ9FX7SLwDQxIse7EKdIU2A+.TWc+UcaY.zRyKwFkKAFHTUTwTSRQXU5YmMVyASFMtScB65fGxhEG64u+2bFe0I.XkCNf517PradhBQgT70y3KUpTrpUrBLzAMXjzN2U0amQoRn3NYPswJwtfKsJPT0MtAeWLH1PN7YNCN7ecAzsHiDK5q+ZKdu72d76+sDw2EM+BePXc9IEe1oYX8op7JwxV3hqU08qrfBT2tpT08SrwnhiIXJg93CDJwOp+o3j6zolJNzucZ3RyZFhb.OK117+PqZ7sW99eKY7ogAnMtTRIEj3l1Ldy+2TQ3gFZ0amlE+H15XpnRN2mKA1RToAl.fnl1Tds+CHvSu.bQjw8YNQhf.2b2otoORMszvucoTwcjW.DIwOD4.dVLkgLXDZ6ZOeWzbZQI.XiRtb4H14LGDZG6bsFVe..JxNGnLqLo65mXaqxJ.iRkPfHQZsKAt6ND1H+Mnlsxk.CDPjHdYhrRfmdA25RmA.fpRKEJtsLC5h4Bbyc3VW5LTUZoPU94a06GDomc138V6pQPMM.H1aePPADP0qBgQDVXl0Xc5TSE..mRpTTXEkA+BH.Th.AHrvBCu76710Zn7I69YaViMwvPI.XCJ4jSFItoMqUm7itqeh8FUEUDD4mertOQMsIFTB.pJtX3RyaNTlW9V8N5JSMR1VnWpSFnpaKSuK+LkUJp51xfqsNXHzKup9Xppnh.SYkAUEWr5ZLwBcdET.Af0+dyEqIojvC8wazjmpmvcIRv+ltLbtSexpeb4mQFPr2davGegd6MD5pq..ne8qe..3Shc1lmBOwhgR.vFhl65uu87opUm7CfZqeh8IUxKjyD.D5kWPfO9n2IzpRtbHzGefqsNXqemHrxJfphKFB8wmp2jqsNXnvSOgx6lgdcHTkednpG87..DHRj5WapyqOLUTAXpTcymTq9QgRkPUorWqALkVZ89cCR71a7gSXBPdIkf2esqF92oNgIN8ogPmPL5U4m33gR.vFAm20uRkPwskQcXJhcIt5HfZHpQMBJzyD.TVfb3RfABg93iAk3f4hhLyDt0gNTqs4R.MEBbQjdOAGU2j.Xi.2cGBb2c.fZkvgwhQoR0IH7HM5gkhMtxuDxtS53q9jOEMt0AiYO6YSyu9NgnD.3YEUXQH1EuDzp.ZtV20OMt9I18prBnpzRqtZuqKQ96u9uFUTi6B2kl2bqds.vTbwPQ14.WBno0Z6h72e..yZR.lSBDIBBpQhDZRpHjl2brpd8TPV52AwLtwiHe1mAyYNywpTlH1F3qQf.Ap6g+evbhEy70mBl0zmds1mhLyT8WvQW7mXmSU94qy8q4Bn5Ck4o9XooV.r1TlUlfoBs+LoH+8GtX.yS8pxOOnHaaiYDwfCpUHoctKDZ65.F9vFFRN4j46hDwJgR.fmjPBIfe8n+BNvt2qVczuJ+mqRKYuDGFJKPtN2uvF0H89XoJ+7ptC4UObjICJ...B.IQTPT0oYXqBkJQUbbm9FZR.JuaFPYd1NSdW8KhHv91wtPAYkCl3Dl.jJUJeWjHVXTB.VYxjICSbBS.Q7j8.eTbwUq8orfBPkW8pN0iUXhCnG0L.bQnWdodL1qmzLW.HzGe.bycSt3YnXJtXnfiDzMzj.THSlMUR...ieLiAKagKFe+d+NDarwB4x0cBbD6WTe.vJJ4jSFe+9RBKewKoVyle.zhjBwwlp7ymy9A.f5ZAP4c0uDeUlW9Ue2+tz7lwKqvfJyLS0yngrzLDh72enp3Rz6gHnlxugzTHVZRjHFeTbwAYoeGL6Y9l3wexmf5e.NfnZ.vJI1XiE295+K17ZWWst3OiRknxabC5h+DGZ0Wy.HxOCnGnWYEUeWyh72edoV...pJszXs+..ntC9IrQ5+EzsEqI..08OfMu10ot+ADUTHkTRguKRDyHJA.KL4xkigGczXri7k0pi9opzRQkW5RzD6Cww2i5A+bQf6taPMCfhLyp5+uH+0+9PfYkRknpztYsljfpIWacvPnD1mCDXiBYxfxBrMGtu8KhHv919NwudzeAwNm4PMKfCBJA.KHoRkhXF23wF+x0Tq4we..k4kGp5pWklXeHNMzzC94hPCrV.zjPgnl1z54Aa4vTl5oEXt3RqC1vRrQlLc1eI3aeTbwgY95SAwLtwiDSLQ9t3PLQTB.VHIlXhXKa3aPR6bWZ0d+UcaY7R6VZw3l6vkfCFt1gNXP2wCw4hJ4Ev4cKC.Hz.mHZzzQ7DHRjAUc6lapjWf54x.VHPjH3ZG6f92LEJUhptwMroSBPyvFzW27.SbBS.xbj9tLmLTB.V.wNm4.lxp.KeIKsVaWS68aHy+415D1H+g6g9XPj+9qdZZMj1x2EIhsJkJgJcTE2B8xKCp87YJt3ZTK.MwjKdlBk4jCmsgu.QhT+4BVVTjX+fY6mD..PTCYHXYKbwXEe1miDRHA9t3PLBTB.lQxkKG8OxHwXeoQgwOlwTq8opzRQUW+FNTs2uvF4OqylY7wDzBw9fxbtuN2ugN02poV.zrtBvmzUa3KzKufqgDh9evrSRBPhDwX4KYoHhmrGHlwOdZtCvNCk.fYhToRwDG+3w911N0p89UUZonpabCGpw2OWW7G.NTI4PLuXJqTcOm.3igsRzUqZAv.lPgrTzUa3KzGeLn4H.6kj..T2IA2zpWKM2AXmgR.vLH4jSFa4a1H13pWmVs2uiXm8Sfmdw8E+4XXQQHZnqZAvXV7azTK.h72e8uZ1sTdzEs45yAh72eCq+J7nECLc02Irk7QwEGF6HeYLwwOdZHCZGfR.vDkXhIh+97W.K+S0dx8QYd44X0Y+..zzdlbn9V82HjZNc9VWBb2cCdb8WqZAvVXxzQOFdfFxHCforG07g1IIADdngh8sicodHCR0FfMMJA.SvDm3DASYUn0T5KfCXO8+QbIv.qdoJkMpjWnUrzPrWoqI9J8oV.RO6rq0uWceAvFnY..9+unMWLnNEHr+RB.n10F.02.rMQI.XjhcNyAiikN6Gf5K96H0S+0PfO9ny6vhQoRnRts4DYBw1htR.PfmdVuO+EusDq0uyTbwPYAEXvij.KIlxJU8x4MKD3t6FV+A.1mIAno1.9989czHEvFDk.fApl8z+9EQD0ZeLOpp+bDu3ODIBtVOegkxbc.OuIVFJUx4vlSXCp+pGuUMsYZsMEYbWvnTID3talbwybQU94wYR.h7yOCddyvdLI..00FvPd1AhgGUTTsAXCgR.v.HWtbLmYMKrrEsXs5o+LJUhpt9MbXuCXQMso5rp+A.TdecODuH51gOyYvoSMU9tXX0Tyoy2ZReZBfvBIDsespxJTewwJpzbT7LaTkedPQ1rWiGtz5fM3NtX8M6CZqJ7PCEa7qVK1xF9FrxUtR9t3P.k.fdSlLYXNyZV3KVzmx4E+cjFle0hatWuS2ppJtXfJoQ.foH0zRiuKBVW0XQ8QK0S03K1au0pe..n9hi1h+cnx6lAqmqBDIBhZVyM3imJ4EvYMKXKSy7FPqZR.X3QGMJpvh36hjSMJA.8f5w3+DvWrnOUqd5uC+E+g5kbUA0ycoTeSvKj52ucIo3wZqy0LonhLyh0pyt9pF+HBKLVS.vVFWq3etDPSMpguntZdAacQMjgfM9kqAyK12BImbx7cwwoEk.P8PpToH1YMarucn8b5uyvE+gatWuCsJlJpvgpoOjWbQH86cup+W4Vo41fzyJaHwaCahvwtWkUXzKE1EVh82PNkqj.L1gun8bR.RjHFe+t1Ct80+WDarwx2EGmRt..nB7Sl.ppwOsEiuToRwV9lM57dwen9t+qOb0Vt1CjWbQ3N26dH86p9h8EVD2UIYPsnEn8ssMn8soMPhO9ZdKGkTBROG6q6n0bQYlYBQMpQ0pOlHzKufRGz4TBExjAFEJUem+ZXBSfQ29etB950tZr7OeYlgRm02rl9zgzKcIL7nhBwmPBH7vC2pDWa8q+XMhuK..EVYYPradZUKDpdTbsUiulK9u7OcIZ8bcVt3ude2+1gi5gKc8qgKc0qgzu28z6milZD3WN0oQPsnEHhd1SDTKZgYo7b4adSzo1FrY4XYOpJYxfacnCFzyQr2Vu49+xqnBjyitycyw64JuaFPUgxgPwpWADUUfwOY4DT.AfQ+DOId1m+4PR646z5lUrGnoCB9wK8Swi28mDwDSLVz3Yqe8GqU7Eb6bxhwJFW6BW8J+CNx91OVYcVM+.bht3O.bI3fq2D.r2lyC9iTkh+PZp57N8MDlqDAVy9SBm6+tB196GuYobYOplquDUdi5egyZM6OILjmt2Hn.BvrVNJuhJv+d6agzu68PN4la0W3mMA0hV.2c2czzF2XDTKZAZp+9COpmQKikR5YmMV7d2MV1GLOHQr5j.D3omPfKtn9+6la06H4wVv114NwYjdQLq24sguhMu0zFo1Db6bxhQrDw7VFHEJuPXKEe5N+eD2bGtG5ioyGBSEUfJu7ksREHSykt90voN+ev4E9c2c2U+E3O5KxqIM28WgEUDmWPn6gGN5aO5gQ+k+uyZ9Jzv.7Eio2CxreAM6IBk3GD3kmP4ilY+zEMCCvHBKLyRryNu7vEjJEW5ZWyjNNM0e+QnctSnUsnkH.q7TSr7RJAu+ZWMV5zmot6OIhDAAdod9VPfHWf.uTO4KUyjDD3kW0am+0RQ5ktD9pM70XNu0aYQZR.a0q+XsiufamSVLspIAvasAwcte1vVI955h+.P8j7iCTmcSWbTt6e4EWDN7ubLVqpe2c2czg1zFz8vC2f9h5xqnBj98tG92acKbiacKTwi5jfh80WLzAL.ip1.lyZWI52S2M3u.wlsKn4nK8ryFG92OClwHFoIcbz0eiXpzjLPncrSVsZFPuSBv.nYoVVnWdoN4gGknfkrVEjKuP7wK8SQ+G3.PzQGsY+3aqc8G9H9t.veCE.g04m7Y70za+O1g+AVerUcaYNMW7GhDAg9o6YnL6g19+ORUJN04+ipu.sFt6t6nGgGN5QXgYTeorGOJwgNzl1fgB00tve72RQN4kG1w92OFXei.8HLC6tV7nA19UMqslfBH.Hu3RL5me4UTAN0e7G3B0XloSru9hl5u+0plfpa05Ku3hPgEot4IzzwQ4plgxIu7vubpSiSc9+.cnMsAQzydX16.o0kDu8FKc5yzrlDflligqNlo.O8BvEQpmDmDJBBafWF0J6XMIQhXr7OcI3KW6ZQrwFKVwJVgIc7pKaoq+vWw2EdJ11TjISV0C0O1XObmtlShZZSq2p9yVtm+WdEUfCcrig+8V2Rq8EQO6oQegetDZGUeGdoeu6gSe9yie4TmF4jadXnCX.50y+zolJ5THAa1JONSL1gBX14kG12O7CnvhJBh80WzivCSuqxdI93a0WDul01SMqYn5NhRpnhJvkt10vkt10PncpSV7DArDIAnKZZVTMIHT8L6fatCgd4ED3s2FcRAZFk.8OxHw2mbxPhDIloRMQzbd22YARZ.+M1ik+vR.eF+6jYl3SSHAroUuNV68rJxNGnxIa3Y4ZvAWcGGhMLUTgM6JcX14kG1w2+8Hy5LIwDTKZAF6HGA5PaZCbQGmalBI95KBsScBMswMFW7JWAoeu6g1FTP0a71wQOJhNpmCYlU1vKAd3T2G.LT+w0tF5qA1Fw+QpRw99ge.A3u+XnCbf34hHBzh.B.d6k9uD8xFWbwE3ue9gNzl1fdDd3n8sssPoRkPdwECk0XxNJm7xCWPZpn7JqDsHf.rX+8nGt4FhHrvw6u1UiHBKb3ga7vZjfRkfo7xASQEAU4mOTlYlPUwEClJqTcSI3pq50gIfl1TLrA+hXRuwafN14Ng.LSeFguu9CeGem5IBH4xkikD+BXcF9C.PYd4Ak2MCdnjweDJwu5sM8rUu6+abqagcr+8Wq67xc2cGCruQfwNhQXwq5UM5PaZCdiQOZH1WewN1+9q2IRnhprLzP+jfVDPiwktoS1zArIxPqAfCcrig+8l2BicDi.icDivrMLNYS.96OF5.F.dmoLELzAN.zz5T6BWPpTr5stUboqaZc5PcQSMA7pwOeHuDiu4RLmXJtXnLyLQUW8pnh+9uQU2VFTVP827pRjHFIsycgsrguAIlXhV9BpS.m5D.FdzQiEF27X8h+pJsT94tbEIBhZ5+G6ctGWTUm9G+ib+xvLiHBCJBXLcQIXltntJBRapTJZFZtkZ.s4lollltlZ4sMyL2tnon09y9snq4tUhQotaTVghT6Z8qXfszJPAszA0xYfAPDF32eLbFlamyLmYNWGNue8pWFyLb99UYXNOeed9774INDRZogPuy6zp3a3JBX.QS4yKTq8e0m9T3.G4H1Uu+3hIFL2G5Aoc83YBBKzPwDyLSj4nFENvQbstRHvXGWCAEbvHg3h0mpoceQ7Tu.3Zs2N12AOHhafwv5232Uj9sLLL2G5gbZsau81wg93ih8cvCBCMyN9huRYxvlm+BwSuycvJWeeBylsLrjpqNz927MnyyedzUqT2kUuxleQzcasiG4QdDNZS5+Re1R.rzkrDr7mXw3Vt4axomq61aGcb5SCzMGZQBAFHBL93QvojBBToRqofu61ZCc2RKbydHjPQvImDkujNpqNfqKrl1ZmTWU3e8Yka2iMBsZwCL4Iya8jMAwz+9iDSXv3GN6YPbwLPmd9FzqGlBxLFo1aElLZDUo6GncJs6KSSszBZ7pWkxxlbs1aGebEUfIjUlHkDo982rMDkIJoDR.FapIXrmZlar4lQ0m5zPVjQ3x2m3qnJ5nQhwoBuxee+XBibjL90mQn6tQ2szB55xW1hwHEP+rz0At.MomNRbvIfYm+CioMsogvBKLuZI46Tvy2qeexL.7HOxifoLgbbZp9AzSu9Wac.b071NjPQPImLB81tMDzfFjchuqaJlY5rAA1epEWSWM2raMmEtlCczihO93UX8qCMzPwTlv3wDyLSdbWYOJiRNR+VFlKetJzoCYM5d+.4eoEooiFcPgaD210ZucbRc5vDxLSNqDPdBIM3AasLDJjaYeQjMfCczixJyeBMpUirzda342ydX7qMSS2sYICrsWcMnyKbAWNvnzld53.68svije9nJa5jCI7b5yE.PwEWLxZj+FLNRtAQmmsdNwne5W3QX4F+omFo8aeWW8pbWfH.HvXikxmuydLmEc0VqfXRrcnidT6LskPCMTLm7xiza1JDoBceCzj5sX8qiJxv4wci3izRIEbbJ9v+e3rmwmLnI1ljF7fwSTPAHyQMJDZO6wpO0ov9N3AgdVH3+byvhyItuxJiwu1rBWucX9BW.Wu5pcYf.JUp.6dG6B+0+mcKMUA8B5SE.PokVJN62+iH+YOaW97cd9yy585e+hJJD7MeyHjTGtaMZGtTrc8K7HnT7e1d5+Ms2hc6IuXaNoN6crMh58y0NuluhxXG..f0L+XrEIM.PGbW6sIVBFLqQNRL2G5AwMcC2..fUOkfMLmn4jSNnBceCzUqHRvolMaMP.GyJJgeA7M+muDacqakm1fhS5yD.PUUUE9rO9nXsqZUt74Me0q50ikTOg.FPLH3gObDxMeydTuvZ9pWE35byXnE.HfAL.JedhS+WgNcXh29cxqis1pO8orKs+wESLbpJ+YJLXxD5+.sX3RgDpkZXJYHPzGw3XA1UnLJ43Al7jwLl7jQngFJZuGgKxFcIvarhUhMs2hEDYxiVX1L5r95w0+1uCc4P4HW6pVETDZ3XoKYI7zlS7Qeh..LXv.V5heRRs3W1Tw+ALfXPHokFBdnISpfVbEluzkXk8CYPU8+MekqX8z+uYoGDyImb3pskST8oOENzGeTqeMwM+Epo3kJNgNcXbidD781PzCWNU.4Bt4a3FvbenGzZ2BbnO9n3ipnB27cQediUrRrhctCAS6ARG5tsVQGe+2iNNa81UVf7m8rwblwLw8OsoACF79IrXeE5SD.viTPAj5xeca1L57r0yr0ZOv.QfCZPHja61PvCMYZ6U1c0ZqbpX6bW5+IJEQE5zg6XnofPCmepSs9qbE7Q1bx+zGlkVqRLdye.fiW02Xm..A.Fl5jsNjajvyveIC.1hxnji4jWdXBYYQqReYUUgCczi5luKZtFxjgUmegXS6oXF85xkz0ubEKkEvFeDPa5oiW541DVxhWLpWfZXYBE76C.XoKYI3Y+iOMoyH6NO24YNQ+ERnVtwe5o6jh9oClajaO8OUo+27Uth0RQr1WeWX14bOb01xNLzbSXeG7fV6y+zG1v7Xq1UnR+bHc+gDVnPdjQxS6FwK9aY.vVFoFs3QenGBgFZnn5ScJFOH.MpUizUeinnCVBidc4TLaFcVWcniZqyZ1.RNoDwKuwW.OR9EH0g.Tfec..acqaEoeyCyks6GfkatwHlZCQq7kdZ9zM9A3Gi1gpz+Sb5+8UVYHmaMMDcbT2o.rAWq81wAN7Q7qt4eC50iglRh18XADPfXXojDkpZWh9dnJlXvSTPAHoAOXVIHf4jSNngKdQwkn.cAcY3p1kM.kJUfid3iH0g.Tfea..UUUU3r+.4J9u61aGcddeyle6WTQgfRIEJakO5h4e4WXjqimBUo+21S++lk9d3gt66lK2ZV4iqnBqSZs3hIFLAATO96s3X++SfbYx7KSoMaRRpTI5u4k6HLhVbcXCiUBBXKK7Ivl1awhR8.XG8jMfNO+4slMfW4E1Ldu28.R1GrKvuL..CFLf0ul0hWYyuHouFewrer1Je27Mi.cyXykNzsYyrZmH3JBPN4oO01S+eWpUCUIw8tnlss6mXVveNR0msN65+e.f.6YvnDtLuyUy5qRRpTgl3J2xjmYJie7XJSX7rSP.8L8.8GvbiMhNN82a0Vg+e20qitaqco1DzA7KC.3QJrP7lEsKRe9NuvE7p59SnneOsU9nKbsw+..D.IiVSGO8+Lxbbbt3+z2yrTGv+5l+..M0ky1obPAaYZsc0Vjx..cwnX+jqzfzukggYL4Iiu+LmAmTGyUtnjToBSIiLE25AvFH5T.BeCH+YOanHzvklg.1feW..KcoKEO6xWAoh9qqVaEl6om18HrY373MJ5mNvGSYOxBjgXub3JqD2kZ0XfCdPb41xRc+6YH5P3ve9K27WWs0hryXTj97QDoTF.nCYpQieeI.bja9FtALm7xCG++bRF0m.xMiL7KzCfU5w2.HJ2a9yd13gmwLk7JfdvuJ.fRKsTjXbwSpn+.rX0udDDsxW5oifFxPX0a7Cv8F+C.HcRC14Etf08xAN5GgIo81Q+iMNtbqgCcziBiM0je2M+A.NQ05PViw45+GZOCzjDTEq+yG.KAqgpdxJ1w+OmjQsM3UWPgXmG7.he8.XClarQb8u+6Q2lMiwkYlXN8DDPSF6aO6M7aB.vfACn327+EKdAKfzWiGk5+dTzuu1JezEt13e.b8o+sUGBUnSGtAYQgnicfHnfChy1WmTWU3GNyY..vCL4IK5r2W2w4t5UPRI3bFUBH.K+53fiaf37brVPD6zWU3jphIFLiIOYbfibDFa.BoTlLrf7lgn1e.bEc2byVbPvVaEZSOcLmYLS73OxuuOsgA42D.f6p6uaS8uMsxWfwDCmcieh8FeLk8bU..larQq5P3MK8fHmTSCJ4vS+an4lvw+OmD..SYBimyma6rMFLYB8K7Pn70LJMoJkA.Zh+rW.3NTESLXtO3CxnhBTiZ0Pgrn7+Lkpq2tUcAnM8zw127VviTPA8YCBvuH.fMrgMfE8GlGo08G.j1xeDJ5mIakO5BWa7OD3X..1d5ec0VKhzbWHzvCmS68+C+wGEs2d6XDZ0JZFjKzgCWYkH+YNMW9bgFQul.jzXAVB5PXgFJxbTiBeeOYNiI3YJn.riRdW+pRA.fd0EvEt.zld5X2aemXIKdw8ICBPzG.PUUUE90FuDoi2W.68xdBBX.wXsU9XCE86ovGF+Cfk9+2Qr8z+68HGF4cGi.8mCu4+I0UEZ3m+YbS2vMfI5Gzq+tBW09ethNQmbvtw+gy0H2KfVgFphIFby8LMAYJ1xBdBTTI9GcEfiX9BW.cb15ghnjgWdiuPexf.D0A.XvfArg0Rc+92sYy1c5e6FNO73M9IfqM9GqDj8k3v1S+2fd83x+7EfrPCEwLHtIE7Do9OtXhQz6xeTQ.xnVLiDZsPpS.nGJhTFl4ZeF+uSqxyjjJU..9ekBnG55WtB53zeee1f.D0A.rgMrA7rqXkT9ZHp6efCZPbRq7QG3Ci+g.GC9oyycdqm9eekUFlwcdmHzvCGQRgQAwjb3dlve4NgI3Wo3ea4vUVIF2XIu8+.50K.jFJPzCExhBKeAyAO0N2l3aD2JvwusT.8P2s0J53zeOjGRv84BBPzF.P4kWtaa4O..DXf8pneA1MV3Ci+wk6iVa0ZYHLXxDp8G9dDmbEbV5+q9zmBM7y+Llx3GOoJ92ePTbtZ5+4H8KPK+J4vRIYTcch++NykjPbwhUL+4fkTzV8Kd+hPhUmeg9skB.nWSChHHf6ep2WehgHjnL..Ook+HfKakO5BeX7OtBa8FgCWYkXzIOT..NI8+Wq81wGc7JvHzpkx5W9Vk8gr9dgsoeQEFT5lLpDRnVbawDhKVb1KRCCqpONJiRF9oFuDjKSFJ5O8Gw+yG89RYPgAQiZ0vnol8uCrxrYzw28cHpN6.GXe6GKcwOoeel.B..nKdZw6xg+zSYqacqXMtI0+Bc3Ci+wV5tcKVQaGmsd67Fg29e8OglgjHmk9+OthJfpXhwuUzeDnq1ZwsoIU295BHvdiIuy9w+YGRrP5onF+r9Ka8qW87KD+kOrTruxJiG2U9WPXPP96zY80aMH.1rb.d68+Xx0O...iWuMNeSzUOqKcW+xKubnHrHPxIkn6ewBX3Ci+wV55WtBZ+q9J65.gJzoCiXHCA.fSR+u9qbE78m4LXFSdxT95ZPudjT7wy56G1j2prODS4db+zTLzP6U7egEovpjUhMdwU7D3blzKED.CgRYxvTxHy9D+6Ym0WOh7pWk0zDf2d+Old8CB.vnAivHLxwagdwSW+lL1Ddo+7eFu+e+s4fcE6QWM2LuX7OtiRK+yvLSMM.vMo++nG+33Al7jcqn+NWiMhzSQMqueXS7jz+C.6JWEgP.yTiF1bq42fsYOgfByKWbvOpbruxJCyImb3gck+E4lQF32s1mE4lQFPoLY781gUoqe4JHR.7xa7EvBVvBvJ2v5gbExY70gOu+aP..JTp.JBIbNUP.DQfXzfQOd8W5K7hXCq5Y3hsGqh4qvSs9GEXvjIb4e9B.27v3jz++8m4LH1ANPOxo+NdUUgEN8oyp6G1DOM8+..gXSF.FVJIiu7y+No..7PBJxnPHgEJt90ruzZ4MwrkBBfAgva.dlBJfu2JrNc8KWAQb81w12zlwxV6yhs9ZuFTRxDTkVWWP+6+wjPr9A..NewArT6AEgXQvSdx5WUUUA4gEg6U8u.G9x3ebGu0GYo0+..jGc+Y80q5ScJOtt+FM0rn9zFdZ5+IfvK.jDBnmSlZzfZN0Oh3RLYDdTN+dk7lX1v.LgUTj+w7tmOgva.5qztkc2byHhKpGu7eZiLlsAS26+wzPr9AP7E7AA3veREaXcqCKd9tW0+Bc36Z+SFm3jmDwI2hUJy1d++2elyfLGE08CusH184cOM8+DP3E...WueRNBHcHf.BDwN3DQjJb1VvyahYiDUGOd98rGdXm4ewBm9zwJ1Yemfo5tsVQDWTOd1mZ439m1zXrf.r8O4ZBfGWaZwV25VwhdrGmRu9WLP2lMCyL3X6jonBc5vvF3.s90rs2+ey2vMPqI7mXdRuQmz+SPvg0aY.hHxv7aMfE1jXhevPQLCzoGOuIlMTnRlnQHaEcvRDjmzVoLYHKs2VepVsr61ZECC.+4mYMXCqe8781gQPvG.fACFv27U+eT50+hELe4qHHL9GGozx+LjSOh+iKG7OdJh4L.ryCd.Zk9e.KmhkfQoIUbh9PeHKShxXFHFP7NO1kIJGfXHHfbGSFB184Bya5Xek8u3r0qA854+r2X1LFdHgfYO4ofktjkvu6EF.Ae..aX8qGq8oWEeuMXDDho+2fIS3r1LAwTFqvJ.fJzoCZTKd6.f9OnARqz+C.DdD8NnlFklTwwq5aX5skeIFL5blhjoPonNHfjToRPmALtrs.Izdvvm0CwuYdnmf.l7nGCdjG4Q3u8ACffN.fxKubHO7HE887OfkIRHeZ7OjwgqrRL8dD+G.f7nilG2MNiQSlfBQp..8Du+2UDnMZ...HbYRCFHOAEA65+cRlBkH9gdCH.GbDz7lX13+p+LB9f.lxXEt8detYjApPG2Ef5yTPAH2rGGd8iWNVQQ6f+JOlYyXLCLVjQJpwV25V4m8.CffN.f87W+qXsqxO4z+70T+yMTxQ+HndfVD8WngGNBM7v44cj8nq1ZEssA2g9hJwTygdo+G.HnfC1tu9Jl7usiPu6PCC..f.PRDEDUTtfPBMLDWhI4TP.KN+Yhxp5eKnqkclZzfCUYE781fTlSN2KmFfxpm0bPWMaByXQOAVvNKhW+Y2rFSFPloVPwEWLusG7EDrA.TbwEiojy8x2aCFAgpw+zfd83FU1aK+wUC+G5fPN8mTgASlP+GjyhPySILaJCvH0lpf9FThEHKHfWbEOAd6JOpf1m6yR6sIHECHfk.T3xr.nTlLrqE+jX8O6ZPoe3+B+6lLvqZCXViIC7I+i+AJu7x4s8f2hfL..CFLfx+jOE2Wt4x2aEFAgnw+..b3OuRL1a7lr90Q0egU5+ADuB.7vUVIxelSyq+9Czlr.LpzGNNdefISFW.YAAr54WnfdTBO6IlCJpDgqO7y0YAPoLY3Exu.7HOxif0st0gGXoOId7ctCdKHt2XEqDG30ecQ2DDTPF.v1111vhl2iy2aCFAgpw+..7gG+3V68e.gW8+EyTwo+uPSp2hW+8GhMsBnbYxvuzhTY.XJHKHfh1vxwF16aJHa6RgtQXw0YA.vxDJbzwpBEWbwPqVsXuG3.3cN02xaYCXKO1iim7O7GDUSPPAW..FLX.+5ktrn2w+HPHp7e.K0V21d+OB4xs5.cBIDik.PWs0ha61uUe5ZX6PAB.n8t6vmtdRXOtJH.4xjgGO+7viskWfG2YjSVZuMb3Jqju2FjBWmE.KqYN3q9vOz5Iue0W8UwDdjBvCsommWxlyeeMqCKdtyUzDDffK.fMrgMfE+3heG+CP3Z7O.Vrm1bt0dCxhKr+WuAwXI.dqx9P7vy798oqgslADfjN.7DLXfdCTEWEDPBwEKlW92OVdQamo2d9L4lQFB5VBkOxB.fkSdutk+GsdS2ryNarmC7t3M97JQQGrDNcunTlLL+IdOXIOwh3z00aQPE.P80WO5p8q6Wz1e..cd15EjF+C.vUu7kgLalBeBw5+qq1Zs16uhIBPQ3zt2+c5ZDPf1kQFIc.3djGB86fEWEDvvRYnHY0Chyu4g+.7QV...17u+Qs6ltJUpDacGaG233uaLuW4k3zx5nQsZLurFmnvi.DTA.rsstUr1UtZ9da3yzsYyniyVO5xvU46shKQWs0hgDk82fRHV++lZoEQW..6qrxv8MowyHWqPiHRq++xkIC003OwHWWIrGWEDPdSLab9lujfKqKB8x.vWYAHIUpvjt4awodxeZSaZX66aeXA+k2fS+2Ma0mfPFAS..0We8Pd3QJp86ehT9e8u86DrB+CvRJp0Njdyxhvs9+BOwX4Np36pFYM5QxHWqPbnL.gGYnBRAp4OfqBBXw4OSr6x9.AUmAHzKC..PlZ3mfTxMiLvk+FcN0NdJUpDkd3CgKDUjbp4AMmbxAe0gNrft8.ELA.rsstUQ6z9q61aGcd9yiqWc0ny5qWP53e1xEt3EcP8+By5+qq1ZQZojBeuM7XZPudba2IyIdUGEB33yXjRyE.VDWEDvple9B1NCPnxbxIGdy3hdlBJ.u5FedWJBukrjkf4tlmEqbuEyYsK3VV3Sf27kdITe80yIqGcQPD.fX8z+c0byniyVOtdM0.yM1nfsd+1RC50iA4fa+EQTBWg1Iza+IaonRNfOK9Oaw1R..HMW.3BHBBf.4xjgYmWNXi64uxi6J6Ic02nf1zh.328ni5AvVzpUKdscua7gmqdNSiGu3i83XsKe4BxNCPPD.fX6z+Do4uiu+6Ezo52U3n4+.HLq+Of3qE.YBw+4H15Hf..WqeRsCHaSHgFlcCPngkxPQZZUKXDEXtYjAdqx9P9daPIydh4va6QxzC.AJUpDaXiaD233ua7Gd4+LqmcGgbmAv6A.7Sm+7hhS+2sYynyKbAz927Mny5qGc2Vq78Vxq3KqoZ6R+efAGrfy++IPL0BfLo3+rEGyBfp3hVPUSZ+UbbJBNgwLR7cW7rBhSdKFxJFwdjuJcRtYjApshSPoy7MsoMML++z5wB1YQr9OW0nVMkAkvWv6A.T7eY2B5S+2UqsZIM+ey2.yW3Bhhz7SFFLYBc0Ra18XJDn0+WrQEm9+xXh+yVB0Ag.NJMR9A.WgLEJQT1jcrmYAOB9S6Y2BB8.nPVTB9.AW3zmAJpD9KqIqtfBwqrwMRYp2SXHCAk9g+KNwAAISjh7I7Z..0We8XvQGif7z+lu5Uw0+9uGc7cBaE8SGNgNcXr23MZ2iIjq+uXgJzoC2U1igUt1g5PI.FVJCEecc+.qrVR3LQGqJDohd+7omdgEf+3N4eSBxxX3UXGHXRpTgy03E4s0mH06aXCavsuVBGD7A+SqmUCv6YJn.Akn.40..1vF1ff5z+ca1L5Tein8pqAcVWcBxI3muvm8UeIzLD6MYonDn0+GP7nAfC8EUhobOzer+5IDP.AhPBKT6drqiqyJqkDtlXhevV+YPBwEKFaFZ4c8.nQsZTcs+HutG7DlRFYxq9VfF0pwf5nSO5T2Ymc1XukVJVve4MX0RB7hO1iik73ym0t9zAdK..CFL.4QHLp8e2s2tkz7Wc0v7OcdAea74szzUc1XhhHJ47vNwyPLnAfFzqGAHm4E+msDtL6+YzHzLbA+o+72HtDS1pWYLgwLR7yMeYAgd.D5HD7sfEl2zwqr906Qpvmvy.dmS8srVPdJkICOcdSGKcoKkUt9zAdK.fssssw6d9eWM2L5n15v0qoFKo4WDWee2gqb+uPCObAoA.IlXekUFV7eHeVcMB2gx.LpzGNNzI3m9rtuJADPfXfIjnUOBH+7tWrsC9175dJo3iWvqC..ggdEdwG6wokJ7e0W8UYUaDlHyDez+he6lCdK.fy7i0xKd9Oga80d00XoM9Dn10KSyIpVmct+G.PHBT0+KVvfISn4.6DIkvfb+K1GHzHhzooV206Wmr5ZJgyDRnggX5oy.H7GfUTzN3s8yXSWinHSPyImb3k4CfsjjJUHUkJQokVpG+8LsoMM7b6XGrlwAsv7lNN167t7pd.3k..Jt3hQAOzr3z0r61aGcdgKHZbqOlle7Lmwt1+CPX2A.hgAAzgqrRVo0+bEgFg8AqEab8myNUkTpt6kvkEE5ebwA.KBxL.YAxa2DVrnC.9VLfDrv7lN9e25Vokg7jbxIiWa26Fuc05XkfX9yya97pd.3k..J+S+TLtLyjSVK6bqOQda74KXzE0+ObAb8+ECCBnS7CeGqz5ethHbPG.iRSp3veN6KtJClLg6cYKUPz5aBEj2+AfvixRetu37mI15A96R+6iaHSM2lfHaEzsT..8NYACYX2LimwG9VO.bd..kWd4XbiNCVecDyt0GSSE5zgg5B09KTM.Hw.6qrxv8MkIvYqmisq4vRYnnN8Wf0W2SnSGV8BJDaZOEy5qkXBa6LfETvL3s+8QLHTV.KhATHnaEuoT.DTXgEh4tlmE26S+GYz.9HzCf2rm7UB..nKNbAe+RKE4O6YyJWaqt0W00HpcqOlliWUUNU+e.fHYQkq6uSEeW0Xp4vNs9mqvUsCX6cy9kwRWs0hwOl6DAHKPdWHWBIBHf.w.hevHf.CjWKEfF0pEDmr1cHjbuPhRA7q8TJ.5b+OsZ0h2+i+XLqs7hLZow7lxS3qzE5I..iWuMNIHf5qudz00YduL2I25qOV88cGW9xWxo5+Ggbga5+E5TgNc3t9sikyW2HUnztudjZSk06w5eoklfbYxPg4MIrw8JbFHNBABIzvP+i0hd.3qRAjVJofiSgc2JjHKs7yXB1U7hO1iiEs.KcgFcu+mRkJQ4mnBFWW.u9SsbT3bdXF65QEcAK+8NH..iFLBivHqunaamEgEO+ExXWOyW8pv7ktjemg8vz3p5+GV3g4hWovAilLAEBnSMXK66S+H7+95uDmutQHSNtZiMZ8qmvXFIdkctejaFrWI05DV51.4xjgglxfPE5zgL0ng0VOwFxTnDWq0VPKFMZsT.aYgOAms9IoRknwvrxMiLvJJZGr56W8TRRkJnM5Af+ym+4XTiYLd08+VxZeFbf29swJJZGLxOyUJSFl0n9MXsa74vu+w9C970ySHH..EJU.EgDNqKHfqdwF84V+qaylg4KeEX9RWR5j9d.5psVWV+egtE.qq1ZwyTPA781vIzUasXn2zP4k0NnfCFgDVn35Wq222e4VX2TFFQj8FnXg4kKV75dEo..bfniSE5n8qggkxPwGK6KgtZqEZTqlu2VR3FVXdSGycquLF0XFCRLVUd08+V9hdRTUliCO3RVBd8mZ49boNxMiLP0u09fgKnGZ0p0mtVTAQF.B..bxM+KszRw3Fi2G4WeE25iowU8+OfvtC.Dx7VG8ivhlK6Z7OTgikAXDZFNq0ldUnSGRPUr18XyNO9umtEZPnG..KkB3433RkHVDBHfvpL...KJ26Ca8EdQe59eZ0pEuVwEyX9EvBtuog0uxU4yWGpH.Xy884hVAvaE+WeI25iM3Lm+7NU+e.H4.fdAMnWOhdHwxp19q6PlCA.L9wbmr1bW2nISH0TGtcO1nzjJNptuTps2bfPBMLq9CvryKGNcVAjjJUhFuZPHXMv1hF0pQj+pAJGavdBD9Evab7i4yhxToLYX943YCwHeg..G0FfD99umReU25iM3BWz0FvgbA7P.RnRQkdPd8z+.VNsIQOnCXo17WhkJCftZqES7ty1t0C.3gy6d30w7pPE48e.HrHh.iRSp3T5qmy5ZhjToBm2FsgHA8XgSe5LxItUpTIJde+M7gmqdeNKYYpQCt9Yp2mCLwcvIA.TbwEi7mk6O8eec25iowfISH5PBwoGOvfClG1MhaDBm9m.GMEnaJkgvJ2rwXas..fniMd6rh3gkxPwEa4JRYAvEPzZfOwCOCNqqIxTiFr7hdMQSV.DZkAf3D2acqakQtdu5q9pLhoA8LET.dkMtQFYOQFbR..U80eMzld5j97Rt0G6PM0UmSi+W.gu..EhHDN8OAxTnztaHO9LFIq3Jf8e.VrJ5fBNXDU+sOiQ4m2jvF2iTaA5HAEbvHl3GjccMAWvnzdq3o141DEAkkaFYfCUI+aJP1RlZzf+uidTFqO7KrvBwLVzSfU7Wdce5mIyehrao.X8..pu95glgeqt74Le0qJ4VerHGuppPJ8zmx1hPuE.A.ptNgiGmKjN8OAQpnWccjPbwh+uZOMiuFF5IC...JiYf1oajDhKVDjrfjLGHWP3xhBgGkLTXd4hsdf+NmrlIGW7nnMrbL2s7Bhhf.TDovqEeW8rlCV+ytFF65kc1Yi4txUh4+ZdefYZTqlUKE.qG.v1111vTmbtN83cpuQzYc0I4VerHW9xWBxBMTmdbgtE.2fd8335DNlahP5z+DHu+CvtuVcJIv32Lt+CvdAGFSOJcmfByaR3Otysynqo+BwzSo.lyzmDmHHvVL0FjKSFle92unHyLoq9FEbkrHIUpPjMaBkWd4L10TqVsXOG3c8oNDfoznfqf0C.nqN5zod+uqla1Rq7IAqRKjD0oPeL.u8RdWj2Dylu2F.PXd5e.KoZNrHhv5WyzkAnA85c5uygFQj1k4A4xjgrx31EEVQKWS.ADHTDSLXTZREmr1ui0OUd+6QWHCKkghLxPCuNlh8DxTiFbhpEduu4YJn.r0M+hL50ToRkV6P.uIH.1rq.X0..ppppf1TcN8+cdA1eHlHAPHc4ZCtTHmAfFzqGsg1QTx77tFgMQHd5eBr0S.X5x.btFaDZR8Vb5wiNNU1o+f7lX1Xak7NL155OAQWArv7Y+gETRpTgSU2YAfkV0LQ0wKn8qgjToBMPRGJw2vjBBj.hNDvasO3L0nAcbtyi5qudFcewpA.rm8rGmR+eWM2rj08xATgNcHkXi0kOmPN.fMs2hQASex781..B2S+SfihAjIKCfQRNwZ.ADnU+umfojyXED2roegI771hAD+fQBwEKqOLkRRkJzjodKmZdSLa7uq6+J3RytiHD0q.SKHPaYq6X63TW+Zd0uurf6aZzdTF6NX0..5piNgRk1aBMz8z+GtxJkRwnWP00UKT6BA.BHbC.vfISHXYAa4CLCfymT0NwJdicJXO8OA1pNelrL.5psVj0nGoKeNYJTZW4GlvXFINptujQVWeg9I.dOiiDTvACEwLPNYXJ0Q21+0qd9Eh+zd1sf7lr.VZGvSHP+r8UOq4vZpumnMAoq1PHlU.L4XCl09MFWk9+tZsUZe5+S9eqQx6w8BZ3hWzkN.nP1C.JpjRP94MIDTvA4ji2w0TgNc31tyzErm9m.YrXY.nBh9cmf6ahYgmeO6gSVawFxiNZDc+UhADmRV6vLYpQCNyEtjcAlA.77qX93w1xKvJqouhPyU.skjToBQ7qFX7TtSPgEVHF3cdGXdaYyz56K2LxfQGavrV..tJ8+la7Rz957qWk6lOx9SDPGtdrKKT8..ClLgK1xUPBwEqUETymruO8ivZdJlaxUxVDTvAamv7Xpx.zTmWysqqhXhw5WOJMoJYNPjP.ADHhNt3whyelXOk8OY00xw.yjKSFdn7xQvKJPgHKb5SmwS4tsTXgEhbe7GCq3u75z566EerGmwxNAqE.fio+u61am185eKM0LBJH98FAhUZ7xWlu2Bzhmdm6.4m2jP3QICgRCailMnBc5vc8aGKutGnCxit2VBjoJCfR4teXQIu+C.gDVusYZ94MIVWrahUBWVTHrHh.Z0bSrVV.LXrYmBLCvRvYJUEkfx88HPgrnDrAMpTlLLoTuUFss.cjQMlwf4txURKCChH6DLg2.vJA.TUUUgjSXH18Xl+keg1WGCWpQLvA5ZgrIA4XvjIDAImfVQz8mi2MtmFzqGAEYPHwAEuS8ZNevl1+dwCOyow2aCOlPBMLqo9koJCfsl.DUL.a94UBwEKZAWSxbfHgAD+fY0tlPQvVL3KhtOvVJLubw6V4mJ39YSVZ0JX0A..vbxIGVex7oUqVL2UtR7PO2F73f.V3zmNizthrR..kWd4Nm9+qP+..N4+sFjjJUL01pOCjYAvBU1dIuKVT9O.hI9Ag.BfmS8eYkg09zKlW2CdCJiYfV++Yhx.3nI.QFgDZXPgMq8hx+Av1K4c8o01ekfBNXDUzQiry31Y8tlvwRA..rp4mOVl.y3lxTiFAqN.HXU+tGDEWbwr5ZnUqVrs+m+GONH.hrS3q6K1IC.e8Wam4+X9pWk1C1mN6nSb4KeEo..7BZPudDYXN6.f.BOS.pA85QPxBBwEuJDNOOWyMXxDNwO7cjp9cgLgFQjVSG+3yXjbZa4oLlAZcskKSFBRVP7R6mYrcguqhpLlAhYbu2MduS7Yr553pRAP3TfBM8.nfm+8d2QlZzfOszRYk1BzVzpUK1y6Zw0.8jf.xMiL748EiG.fACFb5Gnc8K+JsuNM8q+Jzc9ygzRIElZq0mgFzqGpGn3nE.23d+q32+.SQPj5+hJoDTvryiu2FdMQ0i8.mPbwhut1S40WmJzoykl.DUXao.JLuIgsePtOK.J6uyc8hPi.BHPDU+iFyY5Sh0CRyUkBXXoLTAmd.LZR36KLyeR4hssssw5qSxImLdscuaONH.ecew3A.TZokh6ylz+2c6sitLbUZecZ9p+JZ9ZsCkxDdCMBgNW9xzuaK3CpPmNLf3Tha3FuIdO0+FLYBMGXmhxS+SfLEJsNvdtqwNBe5T3zs8GssT.xkIiUE6lXGkwLPjwcpgw8NACFL5zi4pRAHzzCPVZuMA+6UznVMt7oNEqmE.fdsNXOIH.h8k21thLd..5ppJLtLyz5Wa1Kaiul90qhAMn3YpsUeJBKHxcDMgTF.1SY+S7zK72y6o9G.XS6auXwyqP9da3ynHFKhlc7i4NwaU1G5UWiFzqGJ7ft.vQjGczVC.QxhfoFEwDKtqLtCFMK.xCw4e21UkB.vhd.DJCxozRIETccBaGKD.XgScZbRV..nWP.qdVyAa8kdYuZcX7..5pSy1+0dg5+A.ZsolfoqQOcCHgEnpE.EJA.b3JqD24cNbAQp+0UasH5gDKRJgAw2aEeFhr.HWlLbs94Zufvczfd8ztD..VRuss+7TnXQvBQjoPIt2wMFrmxNBquVtpT.D9CfPv7lDxyE.aIIUpPsewWvZlCji3oAAnTlLDYyl7p1BjQC.vQ2+qqVa0qF2uM8qVzLPDQIk9euAxZAPgDGnxOCOVAyl2S8O.vNOz6I3s7W5.QV.tCM2BmWq2PiHRDUzVrmXtzhfEp8RNUDcbwi6KmwwI+Lp+w4rXpGklTwELcYAw7BvXKhie9s57KzqOss2fmFDvBm9zw5e10P6qOiF.P4kWNxZr8l9eu8z+M2S..Bc0gJDQWs0h3T3ZwPITrA3hNXInfYMcd2ve.rjIh652NVAuk+RGHxBvDFyHQ4U80z96uoq2lOs9JiYfVKEv8Mwrnsmm6MTSc0gwM5Qv5qCSR3xhByZZSBkV4wY80xw10jfmYAOB11AeadO.pDiSbTt2jToBQ1rINKK..dVP.dqoEwnA.T+YOqCs+m2U++VatYn67mSpE.8BZpkVfJWLC..DF1.rASlPUm+LXh2c1T95RNgAy5mLwfIS3ve8IEUl9imBQV.ZzzuR6Ob2wA3Ecw1RALJMohi9MeIueCFgD591Sii+EmDM7SW.JiYfblfIsMvLaY14kCu6fiZTqVvKDPBV3zmNmlE.fdCBX9u11H82klSN4fhe82fVWWFM.ftso9+c0Zqzt2+InklrzVHRA.PenxC.DBro8TL1vpeJ295RZHCBM0hm4FcdKEURIXwyuPVcM3KHxBPgSex7RKeYao.V0BK.EUB6mE.gHePYeBV151LlvCTHBIggiPRX3XD4jGF+CTHtwey3QT2zHvyuy+Jl2KtYrhh1Aq+yJWo4lgkxPQ.xBjWuArXQHf.8VyctLK..VBBXCuzelRyBZLIkLsLGHFK.fpppJn8VSy5W6so+uyN5Ds2VaPeSFg7H4+TDK1fJO.fuoA85QzIqRPH1tFzqGMGXmPSp2BLzTy33ewII8+DqnHlXwvRYnzNEyLkg5PbhyDhK19TCJnF9oKf4tzmAwN7QgY7nKBa+M2KNFEuOpISsfFZTOJ5fkfe2ZeVLn6aJXdaYyrRFvBMhHsa3QQvhyel3MK6P71OiDKBAj.9HK..85XfOMICPn4jSN3Sow3Bl79EilTd4kiob2Sz5W2USdm4NzZyMA.fFMZDZTqlQ1aRXgvBOLdc8WwarS7+95uDus95psVbhp0gpq8GQEUoCMzndr8+5973ueModKHoDFLzj5sfwM5QfzScXBZsCHSgRX7JWB2tlaBMnWuGmQMlxPcHJEf9y0f0AEzVV3SvHWaGo55pE2+X32R4zvOcA7bubQXuu664SWGilLg8UVYXekUFxRqVr57KziFI5F8v42PzwoBsYxD5xr8cr0Bxe5XGkb.7rETn2rs8YDSZ9x1r.jbxIyoqsVsZwx13FwJ17lwVdrG2ome1i6tPwEWLJrvBc60hwx.fs0+u61a2qT+OPuB.TBuiKRQTz7YK.VgNc39m18xo2vzPOeP5uasOKh7tuKLl48GvJJZGXekUFZnQ5aBJ591SiOnrOAO2qTDF+CTHhc3iBS3AJDae26EM7SWfE9afuihXhEiOiQhhJ4.7x5STJ.1dPAYnYS7Zlk19t2KFwDuee9l+NxwqpJbOO0Rv8trk51LBz+A3YC5q.BHPW5M.IDWrH.Y8i2JEfXvQ.sE9JK..8N.gl2V1rSOGg0E6ID..PWLvF5p1X2udq3+..ZuMKJPtUGhNUBOCYBz5+WzgKkyDa2gqrR76V6yhA2SpTYy5pdru3jXYqey3F+MiGS3AJD+s2wyS+FWfLEJQxILHO1S.zUasH4DXVuYfnT.9iCJHCM0LlwitHrr0uYXvKy5omvwqpJqAvxDoo2wQ4LAElWt7Vo.RJ93ELtSnmfupEftb3OoKZ0pE28C9ftzKGHxBf6V+...Ld817of.pu95su9+F89..tVaWC..wMPmaYEIDm776YO3IooX6xZziDGmlFaw9JqLL7Y8P32s1mkWD91w9hShG8oVMtweyDDTABnHlX8XOAnoVZAIMDl8jzDkBfXPAIl9PdpvPSMiI7.EfOnrOgyVyhNXIdT1.7DhNVWWRnEj+z4ktBH8TTiy0Xib955KrvoOcrgMrAZ+80ErbeW.e69uEVXg3Fuqw4jga4tr.Pr9AA.XzfQXDN6izdJG3PuOtqwNV..zsYyn6l89HgkJAfuwEtvEAtkgy2aCqPH1N1zi8ObkUhUTzN7pz5yFzvO8y3QepUi+zqTDd4MrRL0btadc+HSgRLkwmM13KuajaFYvK6AhRATXdSBabW+U7+rBlcFq6qdW.cg3l+591S6Qu9oN4IiwkYlPaZogDSLQjbhIBc0TCLZzHpplZvwpnBb7SbBXvn6+b3pqsVLl48GvarhUh4jSNd8eGHDDXKNrlVJEfktBvSzd.SQhwEGN7mWImtl9JJkICcdwKhS7+8kHggLDu5Z3q2+M6IcO349hOGJqrR6986YOt6Buz12Flwu62Q52aP..JTp.JBIbuVP.+7YpGZK3QA.PWM0jWdU5M8+.PxFf8RhhhR.vGiB3hJ8fXcaX4rx0tA85wi+meQZmo.thF9oeFy3QWDF2nGI18qtIdsF0JiYfHjHCxshArA85wsmZhj9795dnslaBCHNkL9MW7UuKfN3o27WoBEXwKXAXQye9PoKTdulzrj0zrF6Xwhm+7A.vd2+9wdeq2BG6Dmvs6i4skMiJz8M3MVwJAf208FjIHvEm+LwhV6elSuYrXqS.HX04WHdmC+Ow5V2573uGhSfazfQe99u..u4a7WvRdhEggTasVEOelZzf2501JV9hdRRW+..fOu31pdyt8gZGYa..wGu3vYnDSv0h.rBc5vMjZJrhv+NbkUhQOu+ff8l+1xw9hShQLw6Gae26k21CgFQjX12+jcq276syA.OAhRATXdSB6or+IqrFbAOvitH2dy+0tpUgerlZvZV4Jc4M+Ii7m0rvQOxQvmbjifw0C8iTYw...H.jDQAQUVUoh8UVY3dW1RgASl7pt2fLAAB.rfBlAmOq.DScB.AIoREsmTfA.K22Ev2u+KAacGaGqZu6wN8aj6cLBWpE.h0O.huvW3p1zy+9h..kR+uuQC50iHCU3HBv8U9Q8IO1mrz5NusrY76V6yBidYvlZRKMj+rlEV6pVE9jd9v1KetygNLZzo+6GqoF7IG4H3M20tvhm+78nOT1UXnolwxV+lwLdzEwphEiJRM0giFage+crPiHRDW7pDsiK3kstMSYO8qTgB7IG4Hz9F+NRVicr3n879N2ccNdUUg6cYK0qWK48e.tzg.GVJCkymU.hsNAf.uYRAFfC+ISPoG9P1YYv4lQFnz+waS556yqcUUUEzlV5.vR6+4st+G.Pmc1outc5Sy4ZrQnNVggI.UzAKAE9vyvmtFNlVWClLgQOu+.smvbJUn.4OqYgR1+9wkO24vWchSf2bW6BqYkqDYM1whrF6XI8CYSNwDQVicrH+YMK7xady3nG4HnCiFQI6e+H+YMKZ+g7ePYeBlvCT.uz1fgFQjXri9N3EARZKwD+fwLt26lQyBfwNtFicsHii+EmDa+MIOKNZRKM7km3DHKuLHQWQ9yZV3GqoF2F3Y00VK9fx9DuN3RxlJmKJ+G.a+fbWmaHFy..fkr.T227M781.JUpDO0y9r1YTPSRiVRmQ.LR..o2Ssr5xGD+GPuV.ro1kp+uXlFzqGmuUCLpv+LXxDt2ksTTMMNMRxIlHdycsK7i0TCdycsKL0IOYe5TY1xTm7jwatqcgKetyg2bW6xZ8b8Dz8smFiXh2uGKfLljYLUpG9LM0I6eiTKkBXPLZV.TpfcuwgglZFO5ReFJVeE3nG4HH4DYd8SPbsW6pnV3j591SiI7.E3UAADZDQ5zHCFvxXCNyLzxYi0YkQISz1kHdRq2wEnUqV7nKe4VKeCUyH.eN..c5zAsoaIC.c0ru06nl6IC.0coFQVZ05qaMI3I1z91KVyebQ970wPOiHT5dyeauwu2bJc5R9yZV3qNwIvmPia.PWUjyTDZDQhgLzAQ5GxpTtbNYeDtrnvrmdthFs.Xwrm9YW9bD2flsee1ZV4JQI6e+TtN9RP.Cfjr.LgwLR7w5NIm3M.hwVAjfL0nAu29dK9da..fryNaLvaSi0.2RMlXPUtPuT9b..1lxFeMC.s5CcPfDBCpPmNbaiRCiH7u9Ov9Sqa9qTgBqhuJ+YMKed8oKYM1wherlZvKu4M6Q2LfuBBXIy+Q4MmAzVhI9Aia+1tEe9zkrg4EYKFZpYJEv4Ku4MSqL.4KL0IOY2Frgtu8zXtKc0z9ZGTvA6x4D..vByeFXi64uR6qo2f2psGg.S9NtSZORdYKVxRVB9tVLAc0VKl8DyAEu62zoWiOG.vU6Q3dca1ruU++Njp+uuhPXR.VzgK0mD9mi7PqaMdzM+Ip+5ZV4JYr01aYwye93KOwI7HACxGAADy.F.BPQ3t7DcF7P+jmIHf.BDOVgyF6ori3SWG1v7hrkkuNxc4uoN4Iy4AapIszbaP.ePYeBlKEkrfLhNNUHf.CzoGOg3hEAIKHVW3lYpQCmJ5Pll4jSN389G+C9daXk0uwmC65i9P..z4EunStVnOE.P80WORdHVR4ouz++.8NDfjv6wcSBv.CJXVc8e98rGr1mdwL10S22dZOpM+HRAOaT+UukjSLQOpts.8FD.WJLv7ev7va8QNex69O.kb1d.vRo.dpGu.NqFyzECM0L9fxNpKeNkJTfWdyN6E6bAdRP.68ceOZ6HkADPfHp9GsKetEm+Lw1J4cn00quHxZqcNeTASFJUpD+oW5kvS+WdcrvoOCrGGZqSeN..hTe4K8+uDbCQxhChmFzqGMGbWLVOj+2dmR8HKVcsqZU3M20tXj0jMXMqbkdz9yhmx+DbVKBpI0aA07ymiSVK2wjtmIfO6+90d82eC50CErj1E19t2Ko+LYwKXA7ZPmdRP.O5SsZZmcI4QGsKaKP.fYmWNnnCVBstdzky0n3yLfrEu0dfYKRN4jwzm6bwg+7JQse4WZ2y4SA.bricLnomV.rqV8sYHtsd.f9lLB4QFoOc8jfaYEuwNwZV1BYjqUC+zEvxV+K31WGQq7IzgHCEtSW.dasa8VJX14IHN4cPAGLxeVS2q2Kro4EsWRNAsREJvh5w893SHBBfJnq2SXwbfh0kO2nzjJNYseGqJHvDiSbaBbJkICQ1VazxXfXal1zlFtPvAgzSdn10oB9T..FLXvZuZ6K9+uiznQiVsyPID9ruxJCEVvLYLG+atKc0t8CrV6pVEuHzOuEO4zZ.VpcKW4XfYM5QhS7Cem0utBc5Xsaj5NFe1YZ2dQHvGT1mPpx+W7BV.qq5eOEMokFkYYpge5mocfkxTnjzr.rv7mAqNrft7kuDqcs4Jl8uc7nTObj7xUrt0sNTi9KZmX.8o..H5..e8z+.1aCvRHdvfIS3ve8IYrAdy128dozo0.rbhZwvI+cDO4zZ..Ka8alyDE38MkIX2IuYCaa1SwayHAaMHfH6z+..Or.K3y7m0rrNOAbEePYeBs0C.YYAfXXAwVh0afCLVqdBiXEMpUKXZIPBHLInpzUk0VBzmB.vZG.v.A.PLFfkPbwl12dwqrQlIs0FZpY7buRQT9Zb2ocD53o6+49TbSo.lZN2MdqO8i3j0xc3XFI7TXiAAjEw+4ZMnL0IOYAkfSI3k27lorySV15eAZIzTpxBPg4MIV0g.8GDEtPpk.IPqVsXoKe4VssXeJ..kx6I8+RmduOIUnSGhdHwxXS4tm6kKhxT+qTgBbf8ueFYs3SHlCATgtu8ztMXHlhBl0L3c6Al.ghtDNNEYgpfYOaNbmPON.EFEjglZl1kBfLKBVtLYPqlah0deSqLXIk4KlSN4fRO.6JXRug0st0g5qudXvfAuO.fxKubqc..STBfqKEDgnihNboXMOEyI7Op7Yc.f0rpUIHO4k2vZV4JcqOA7buRQbRo.d3YNMbnS9433UUERO0gw5qGU3MYAfMlC.evG9ot7wUpPAl5jmLiudLEJUnfxLLcru3jdT20P.YVDL.PdSLa7W+vCQ68n6PiZ03y+1ukwut7AcdwKJnDCHAu5q9p9V...vZjlLg..kz.f3Bltm+etWl5S6NNalY59KP0o0HX4qma5y7652NVbhpqhW0..AzMK.rwb.fLcnHju4OAScxSlxeWwSDYqsnLlAR5y0I5lwaKPExj42LYXW3zmgfX9.3HZ0pEImbxde..Ds.HSb5eIDWnq1ZYzd9uge5BXuu66Q4qY2h359SFJUn.k3lRZbru3jzV7VdCO7LmFZ3JWl0WGOA5jE.1Xvwn6aOMop+ebYlIiudrATksL2YswNBUYAXXpSFGqxOmUZKPwtP.ArLk.+rC6aNcIahukA.kJrLBfknOEuve+uwX87Of6O8e9yZV9Mo92QHF0vTwehizBvKuAgSmUjcV+FOJK.mqwFw3F8HXz0lp5+KFx..f6covm6UJhVBBLREt1gHGl5jwsNn3Yk1BzeIqvS9NtSWNHdDB30A.b0e4W..yH.vl7SR2SeAJ5fkfmbg+dFKUwTY0p.V9fr03A1oqXF2M7fZ3m9YNQPfLUqbxD7vybZ3vm7y4k0V2298t7w0jVZBld+2SXpSdxTFvh6B71VHqi.jGYjPVngB8MbNFKaLIFWbP24OGZyOnS...xMiLb4f3QHfWG.fxdhHr6V8OhRSB2SC50iy2pAj0nGIicM+auy6QY8HEpsbEShm3o7TYIs9qLsodOtc3yvFBWT22cJW93b0D+iIgp2Ws2288nLaGNhq7EfQoIUT2ktDJHiwhW6sYlgfSRpTA..i+5UYjqGeiRYxPmBjxq4HdeF.H7..oR.HZvWm3hq3M1IVyebQLztwB68cot9196m9mf7m0rn7FLzsts9C7vybZXedfGEvzBWjrNuPrT+eaI4DSjxVN84dkc5wWKxxBPa8qaHKzPw09kegQmVf9ScF1TF0nEjhAz6y.fUO.PRDfhE7Ey0fos6W.KePKUs4l+bs+cEuhGjEf9ZbW+1wR4MULxviuXpNQrXLC...KZ9ymzRWbru3jzJK.QE8.b5wTnzxfXJu6XD3MK8fd2lzE3unA..Ki43u4e+u46sgS3UA.PzWiRc.fvCSrPFYLXxDNQcmhwqQLUVsJfv1vUXCxZrikRuAvPSMyIcDfPhGdlSC66iIWLf8e.8mQWuFNO4BiSrF.fREJvhWvBH8426679d70RlBkHf.CztG65gX41HxBMTbCxhhQyBf+j9vLe4qHXFSvD3UA.TUUUY4CpLalQ1Ds1Gq1lrEZTqF0coFY7q6S+56Du7yw7VSKUFRRxIlHxxMFki+Htyg.4pNBPHwPG1MPp.yLzBy19Y0SR6+IVu4OAqYkqjzros228873NBHf.BDQ5P1DhRVjVO3QNollTV.HgEN8YH3FPP9Ta.1ECYWil6rCF45zWGExjw3WyCWYk3tlPlrRcVIqWqA.xuO1o+IvcYAnge5moUJa8GXQyMeTDI2To+CjYy..YkjRLo9exfJ8zPmNBPd+suL.VDBXuG73FjEEiYQv9S5.HIUpvWehSv2aC6vqB.n95qGJTnfwx.fDBSLXxD12w+T7vybZL901c1QpPaZqwkPU5ZA.dsc+23nchv.kxiBMiNY0YPOAFIIajhQA.5HScxSlz.Y9fxNpG2kIAEbvH7nr+vFlZuW6XNmTSCuw69Nd+F0F7W5D.BRSU7Bpx.3UA.zPCM.soK4Bf967zu9NYrI8mib7u3KI84RNwD6SI9OGwcs93GT1mzmqk.WyxVHJpD6sb1JzoiwbiRBz8sttE.8GfJs.XQeIT6Fm1hBaxB.Qq.ZKSI0akQFpS9SY...H2wjgfpL.9TI.PmRY.PngsQh6Kb3JqD21nzvXS5OawPSMSpWqCHdbaM1jE4lr.PmOr1efjRXP37s37oAY5RSQVfUtavMIVXQTLi.nSlkBMhHsqk.unQi187ZFRh3HelqGnRdB+XiVBnveRC..Bux.D..PWz7ahnK.XqV.LkXikQURZeExTiFmhD2afH0+KZt4y.6Jmwc0v99xMWVYcESj+rlEk0c1c9mf+HE7f2ucmpTHL8BEanTgBRsd5F9oelVSeRaaIvjRNAmd96JE0dcV.FP+605g8GlI.1BQY.HtuKcu+KSQWnm..Ld81n0lPV2ci1+puhc1U.PVngwZW69x3oQSylo9GfbgVQPeQ0+6Htary5NOTvejrF8HcxdfYxL.PUfoI5GURJpzXx1oQV.hPlbq++tJyi9ZV.HveKK.4NlLv6UZov30s72K5d+Wlft5YcCB.vnAivHL5lukdo8NtNasujfEwSpmFal5eBnp9+9KoZkInfYOarWJlVf68cJUPM.e3Bl1TuGnq1ZgF0pQScxLk6xSveRSJZRKMnIszftZpwomyxb4348nqCgX.aqYSX.w65QFLQV.lSN4Pq8XzgDh0++1ZtIf3b1FhEqjjJU3+7N+Cb+y5AA.8u+KSRP..JTp.JBIbOVP.gFbHt+EIAuPq9PmYPj5+RJdGL3NxYnRnU9CpsloHqwNVjbhIh5O24b4y+Ak8I84B.XJ2yciMrtWBZTqFJkK28eCR3Rxe1yFKakN+dGKCmqOwiM8qHjIGs0rktyvT6sCYgFpcOulgjH15m8ozN..aweKC...2QBCAMYz.jqPIsu+KS.QF.B..b9hKA6QbCz0Qh6Iv1o9G.nge5BTpfcoL.XOTUF.5VyV+ATJOJDfLK2jwXGbWF.72fpQP8G7gddZ6IbFPG8B.awWzB..v0Zy+6my4NlLvmbjOD.7y8eCv10ktK9UYnw9nDBGHL7G1L0+.tuMqRWj63ZLMtyPj5qYJP..22jFOJ5fk.kJX1N.fJa.1eCpzXBUimaWQ3tw.x7Us.zJCY3bBIRRkJ7M8zM.70guCvaWaEgFNCuUrmThMNb7pphUWC+U5ne8i1eOFLYBGV2WxJF9iiP0IVUpPgegiqwjnIsznr9y8E6FfrF8Hwa8IeDF2nGAidc8WsAXxfrtswPSMSq.KiLJ4XXojDzcdWWpJ.eKK.l6v+zoXGRjQglL58CnMl.AYl+crNRR34DsRxsFUxbUK1xq+cE9iCaE1F20M.80LEH.frx32.EbjF.7WCJkp2WcLJDpqiDtrnfbVNK.9SCEHBxMiLvG8g+KdcOHHC.PBtihNXIXZyXRLtgpPFT4++RB.z03t+couXY.d4MrRF2E.6qgREJHMna2YU2NR3QICs0uto70LhDRvqyBPmczoG+ZMXxDmXaz9JZTqFe+WyuY5VJ..+LznVMkohyVZPudTi9yy3i4Wpve1pUYKbmyHdrO2yOslDRXKjUF.5lYovhHRnPI0YjIC02DdyR8NGrrsl87TkazjI7PqaMd05v0DbK7qc5KXC.3xW12czt9hPmIB3l96+MNK0+DH0A.dGTEDvw+288x.fDLCT99JZjYoHjIGs1k6Ok9coVsac4UWc5c5zJfIoRELXxDJ5fk39WLOS1okNJu7x4s0WPD.PfAErSOVXAEjKdkR3NRLt3PsjzNN1pl1meO6AEVvL4rT+C3dG.TBxgpx.zWUG.R36nIszHUiCz42WCJ3fw.i28l0SNolFdSRFsyDTSc0AMCwdguR2VAbN4bO3HUUEZPf2wZiUiF79u+6yaqufH.fH3vaB4uSRpTgVZucW9bDpoUWs0hlCtKj0nGIWt0fwlnNMdRV.L43trizWTG.LMjoofiIfFdKrAjoC.pbrSWQXQDoG85tAYQQ6Y8BcaEvwltFbWSX73o+KuNs993ZTJSF57p72HOVPD.fqPnG4lPlqG.4+X0fISXmG486y4fbhcn5jZ.RYWgIfKyFlPBxxtDc0qilTuYOR+Q4jZZn3CeHZcsoaq.pQsZ7qW7h32ujkH3KEf7t6Gpu954k0VvF.fsdAsDziAnTIoO2l1Sw3IW3umC2M8h67..InFpZSR5dZMIjf.xxtjglZFM7Sdt4HEy.Ff6eQ8PXs2NsOjGcmJflMX.SaZSCeqACB5tBH2Lxf2zAffM..I7dHyLfzc9ygaH8aj2ZeJppSsjG.3dnRG.GSpD.R3kPk6a1v4+IZcsb0TAzUj2cLB7Zu8+vkOW00UKT4hCDXtS5kEfzSZnnpppBacGaWPWJ.MpUip9p+OdYsEzA.HjiZSHiqLCHSs2NN7Y+drn4lOOrijfIvc5.PpL.R3MPkCbRGCAJqQORT2k7rt2RVnghydly3xOi2PylPbxcd+zLMMCnzRIETUUUAkJUh6dFy.GtxJo02OWhYC7iN.DDA.HO5nc5wzLjDQM0UGOraD+3Ju.XWG+yvVV0h3ocjDLAtaNIPkIKIg6Iogj.oO2w6iJDP1b9HTXFiEEUB6UedaOYcgEVH1++4eKXOTYhJ6OunC.AQ..RvrnPlL6REWI+eeIlRdSzs10oDBaTpPAkyE.oL.3av1CBKgLjF..MCprMPsa.ZKwIWAp8G9dmto7uRxogIyJyoByl5sriacGaG678ElyNiwltFdQG.B1..ToPApttZ46sgnjL0nwZp3p8xMhVTFFlvX31V9SB1gjnH..Ig.Jg2hRRDNb8mmdA.D2fimVu9Qm7PcJ07A2smGDg6Pd28pGpjSNYDbhCg1sfHW.eoC.AS..AFr8lATbxU.CMKLSWiXfqGP.vT6si8W8WimYAOBeuc..0mPUZN.3YP0+NYvM9rfDtmjRXvt7w6q5E.rcYkzLjDwa+u9mdzqktZ..vxMVs8j0qacqC6prOj1WGt.9PG.Bl..hHJm6AWiljb2LukAnTI10w+LrtkMO9dqXEiRtUmOCUY.PpD.9NIODWG.f+NT0FtzwkIuF5h1q8HFh8mJuwKeYZeMHigDWbNUa8krxmFO+d1CisFLE7gN.DLA.3JBvOcNPyEzUvAioj2DQBwYu8b1UWl4ocjDLAToA..of.XKpp5p46s.qRhT79ppogg.EWBzqD..VLFnR93Ox5WGQfAR5qktiEXMpUiFZnA6drryNaDzPFrfyr43Cc.HXB.H3fk79eljjhOdjPbCzoGuiqQOO0lII8gSt+C3u+ArLEtytjcmcKKA0j0nGgKebiFMxw6DtE2EXIaSGM0DZPudVQk9+x4OuSO1RW9xEbdCfF0pgNNVeBBl..bUI.tvEtHOrS7OH8TTiepQlKUZLAJUPtUq5u+ArbERY.fcngy4YiXa+Qnaq.ZhjYQBUjyslFJpjC3xAAjszpWTFwtcwgdTpTIxqvBEbdC.WOW.7p..ZpeLmJMohnBKTNYc7GISMZvopsd9daHAK.UFBjzTAz2XbjjAf56CD..YuupdZHDvwM5Qf5HYZjREwIWAt7EbefFz0M.A.jGnySaV.KdCPIU80BJuAv1tVfKvqB.frVFwWHjvC2oGKNEJftZkZEPukVag+R2uD7CRY.f8PWM0v2aA+ZFcxCEy6E2LRI13H80P2oBHfkIjZUUUkKetBV3BXUyHht3XWKv1HXJAPntH..UxUflZoEdX23ePPvYcUzVqsxC6DIXRnpU.k5zBeCpFQ1RkohcQyPRDW6ZsAYgRdle6niNo80MIUpfACFb4yM7aMUzZzJELBBjv9h4JDLA.3JjLCHeiADobzj.J8VRv9H4E.9NRdAf8PGClJogj.p0KJA.Aa8AmEkOu2jAfzRIEbricLRe90st0gMs+8Q6qKaPRpTwoFBjWE.P+Bh4UruqlG.RlAjuQVZ0hSUWCt+ExQjLIevJf++GtxjH4E.rKj4E.02fv42kXCXhR6lTBCBs3Eh.j.WMDfrEydQqgqzMVftRkJwcL9wKXbHvt3P+uwqB.HPWnXe1hKeYOa5RIgyjVJof+itu0tGq8V4uRpjzP56505LI7cKa4uCYsqpjF.DFzdasQ6umydJpCLdIKYIBFGBbHJbdZtxVHnJAPTtHK.gwBYanuBJkISRHfRHAMQapRA.HjwaB.XHpHWXgDrjU9znnCx+BBjKEBX..vKLuQti243jW6FIbONJDP9zI.oZbqB3+OxUYJTPgssBHUF.ekzII...o2i5IzUTQvpW+N8Bg.Z3JWwoGqKG9yryNa7sFLv6sEHWIDvtPOA.X75sQqf.znQCqTujHkaeoEp8xMhqY1Lu+CDwLonZP3mZr2xnb8q480myWou73VkIgLwZQfja.5angh..jzph6Qob4r50uslo+6uczK.5BVtuGf82+a8a74vl1Sw91FzGIIUpXcGAj3u+AA.XzfQXDddKtzN5BN2zd9NA4P59Kql+KdwE7Dnl5pCYpQCKrh9+jdJpwopqdmlI.BQpplZbqU2JgDbAiaziDG6KNoSO9wpnBrlUtRdXGIguR8Wx0s5mc2+KhvPvoLTzfd8HIUp3vcm8LvHBmz8KSRP..JTp.JBIbOVP.0qLZzNb1ek8UrnAf5r908O1AhzSIEo..7AxTiF7OJ5iwDFSu82b6s1BBMhH4k8CYevJfTeVKgvgrF8Hbc..9wY.frLKQ1uuxWX7WuJn6LaTiZ0n9u6zH6ryF.8dBXiFL5z8+V2peFrn4LG7FO0xYvcM8nU8WBIGK6E.Bwe+C..z5l+..Z0pEGmkqQgtyeNbmokNRSsZAiIMHVIz94ZqvTngz.ARBgBTUF.+Uc.P0HAlNzMKqA.uAENzJfA.K22Cv46+IDZKvjhOdVcz.S72+.H9B5.aXEv.16E.eQ8mEyNmb..fQNruH8GY.QZ+OuZuc9qy.HaZqAHkA.IDNL0btaRet2+vGlC2IbGjkciwQg6H5JnZnewDbcunK.bEA3veZKKYIKAu0w9LFYc7FROE0rZ...V96sW2FfFamY9gfiDZ3giFaxHR4ltYV452WDMpUame.zkY9quOTJm7ObveN8pRH9fra7I89T9EuoM.SLt3nsx5+sSaZ71zBzctWHSgWG.P+YIARDR3gihq7DXASe5VeL4x3NiGxejwpQicA.bcVJ3MOApRsJPeiotlDhClZN+VW935poFo2mxyP2VALIUpncFFKrvBw9qjeB1SoLYjN+BXR79L.vRslWyc2EF3fGjc12X5pUKXroQwHJkICWqkda+ut4wL.jdpCixmuZIyVQBABTMXf9fibDNbmHtPo7nPiMwtkyqUunU.8FVxJeZruxJiSVKGQV2cy5qgWG.v.FxPXx8gUJ4q9Rrp7KztGKo3hSRHf9HgzcPVGLPWiGmHfJkGEkkAPxs0jPnflTuERGLP68sdKNd2HdPSp2Bz6mnmmryNa74MTOur1tx7hXZ7Iq.loMnmFzqGxkEERzgxKH0I.9NYo81v+o5uy5WymNBnFJxBvwpnBNbmHgDTCYhATpL.7Ks5Ei8ZuMk5E93yiWrHXGMuH1.uN.fwMtwgZpqN2+BoAqXm6vtZ+aKRcBfuQtYjANYU8pCfNtlvrS.jDXkDBIxelSizma66bmb3Ng8gr1vUAEYriuvbmzep.5soTO6ryFUVe8btizljJUrtk.6SY.fI0AvgqrRjaFYR5naj8qFh+O15G.7Yq.NNJB..PpL.tC28uOJXYqXsuDTUF.+Mc.PlH4bmvc4C5rS5OO.7EV+FeNTTIbaV.RRkJVWHfdc..Ymc1PWs0xHaBClLgCUYEV66eWgBYQIMS.7QRQUBVmK.c5EyUalB2IDPor.PMtSMyBwOvVLCYYAn9ycN+tf.DKzhWTB.eAsZ0hVhRFmdOHuo0EoK9XF.XleHTTIk3jv+bjL0pkwK4PeMFa5ZvI0YQG.7YI.TJOJJuI0G3mZzJRHNI+Yd+j9b6wORLfjE3MUh10UjdpCC5Nu+m9HVxxWFmlE.uo0EoK9T..82Mi2UOgCWYkPQTxbR3eNRZojBqa+v96nQsZ7C0Y4WLud672TAD.HqeC4sX0wNwIfA+DUDyFHI9LtkjRXPjZJPevQNhe+OOnaFkna.CdCs1L2qIrjSNYNOK.W8xram.3SA.zj+lR8pK...B.IQTPTMdJRClLg+VY+Krf7bsv+rEkxjIIDPFfP51xDWrKyl40x.LtwPsN.7W8aclfFn3FNz01VkvyH+Gv+VLfToqDgnlRLySe1EWmEfnBJPV856SA.Dc7w6SK971xlwtVgzn0jKIas2N93O2xz8xbGWm21GT405.9u9sNSP8Mz.euE5ywCOyoQtm.r+8K5yXEUoZVRSI8BWmE.AqH.A.znQiW6PeqnncfEL8GfTU+6JjKIDPelwpQi01ArMdzPf.nNH.IwUQNTkAfzGtzGVyVPlX.MXzH19t1EGuaXVHq9+jEziPfl90ekWV2Bm6ixYYAPd28iUu99T..JUpzqZEv8UVYHM02HxTiFZ88IIDPeGkxjgP6Wn.femI...2GEA.XvnQof.HApRWKaOI15Kyhla9jVe6Wam6TTmE.xxpTxCQ3F..egVsZw29KruK8wE3SA.3MsBntZqE5p8Gork+HCIg.xLb6obS3T0cVdsS...lx8PcY.7mTXMSgAiFo7FMRoqk8Po7nvTyY7t74D6YAfrfJ81LJ0QHA4KaGOB5NPfXRVxxWFmLi.TFkLVcr.6SA...zjYOWLF5psVro8VLdwE9Dd0ZIIDPlgbyHCbvxJGc1Qm7pP.s7ApTWF.w7opXCb2vRRHmxV+AVyxVHoOmXNK.jE.fVuLfxALvX7ksiGQabz.AxUvUyHfzSQsvN.fl6zy7TdClLgcdvC3yh9SxQ.8cTJSFZrwqB.fN3QGADf5x...Q8opXCpxMA.HkA.1kjRXPH+Gv09BfXMK.T0wMoK89IRovGed71jBjovmC.XnCy8uAwfIS3o24NvKrfmfVh9yUjT7wKMXfX.tKs2NNUcmEs0ZK759XJ2ycSYeCKM00rGcj3W6.R27mqfpr.7mdgWPz4K.T47lB42S0da7qFlxN6rw9OV4r5ZHOxHE1Y.vccBfASlvCtt0vH27G.Hyz89NOfs342yd36s.sI2wXoL.7sN.nptp.VL8l8t+8yg6HgMTcZMMCmZKVVBlApxB..vxVo3p0lIqkaE5dJw0Zie+rK.KYAfMuejF0pQCrXa+5yA.jbxIS5IxIt4+KN+ExH27GvxnAt5Z+QF4ZwTnQsZdYbQ5KjjJUn8V5.WimaEP.fEM2GlxmWJK.Vn9ycNJOco6FxRRvb7RaXkjl4pO3HGQzXjUFLZjz5+S0T6TBKTXgEh25XeFeuM7Z74..zpUqKugrASlv71xlwKN+EhzTq1WWFAM4lQFngKdQFa3HwUjsFKkAncdtL.ZR8Vn7zFG6DmPz7AprIt6eCjpWK2gR4QgEM27I84ez4OeQgf.opUacmYcw2bcdtD.Db6Ymsnsrz9b...NOS.Hp4+tVwJY7a92ZSMiq8K+pfyPf1xBeBro8VrfaeQEDcC.eaHP.Ta0p.VpsZecNVEUP5y4tArjDLOKZt4SZWWT+4NGdNQv6YIK8+hg2Ow2Z.ffBKrPTzGTJqc8Yy4A.iD.fo90qaEoq1Zw71xlYrZ9aKW4m+Y7se9miaM93wIDX5...XKK3IvSuycv2aCOFBSAhuy...0VsJfkr.zW2Xfn9zZjqiBIXGTJOJ7xaf758+Z6ZWB5LWQkYa4quexDO2cQbIJUpDAGe7r1g+Xy4A.iD.fFMZ5wferzm+6ZEqjwu4+4N8owYq4+ZY8FRh33U8ML50mIHIUpvTxHSQkd.t8TtIbniVN5pKOqcNYSV6SQt5pADehqhIwcdhfT8+4GlZN2MkkuRHWJ.pDW6TumeqOcsGbJI4Se+dJszjvvWXdxm7I4zgDDSAiD.fVsZwl1awXmG7.3u+m1HidyeyczIN8I+RzX81qDxVaVXlpcwld.lSN4fuT22g1E.kAvcYAn9ycN7Zhv9rlIvcCGI24phRvdr6WcSjJHv5O24DrAtR1TLzcFzkPBycxeFYlsjbxIie1L+4LgdKLR..u+6+9HSs2FiOY+Zsolwo+xuDM6hg9.eMHH7DDa5AHrtCAW7hBCQr3tr.7bhv9r1WwcyEAModKbxLXWBWy+e6ctGWTVs0G+miHdaF3Q7FhXCpjGLBePOBlBBjnLUPHhIciacPeUgLu9ZnFgjQRlH4EP6j1QPyymTgHuTQhlBHZZWXjvrb3U.0DnRY.TBPw2+.GTggYdlYdtM396mO8gXbO609AGbu1q8Z8aI2d6Pb53ysYrm8H5Jk0L1yd5zeOJLcThiD5bhb1QY1ILPR..ZwHey0TSMHhPCC+CIVfnCdlr3xp066+Bm8r3V0pc4dz0GaX3Pm7jrpMYS9nkGKl65RRnWFLhvT7r3v4JNJkkvBIHcl7Q0nVsn8DUbE5K7+5KAJIv8rfYGtduJ.c0Dm3azUBJ9FyoyqtAwFFRh.Va6z7jVZ2WMU7wGePA+5uvRyF2SK3dN.ntoFL3eHTTQEg2X1yFyyKuQ.d3Aqtvzbe+2QG5TO8vjKJyC.MPIUJVY3Qhkmp3Oo.oczQbju8TnIQRh6j7p08F7G3vG9QpDBbScRnZ0PXgPNwlXf8siMqyHwLU+8WTD8Jcc5eumn6Pt81wyqHiGCoT.sYHCos++VPq66AXb6+0YLNinA4IDn442B..00nFpAySTk8+YeF9+xuP7dgGIqde+M0PC3h+TQc5o9ePj1ydhZuwMXMayEP6nin3RebjZVYhXX4Hjv1Lkw5FtnpRgyN6rPuTfWSzcDnBewAx4nc5XhZ9yGWr3hAk0VyiqL9m7Jn.cdxw.UnaoTl.+AkUxv1S48vKD0Bz5edMpUiW3UdEj6gOrf84V8EAs3VRz73pgeolaVOJq5NdUmF59e5ho3+ygssp3.MKV96+0ueMsttYCr..vZJqg0V1a8lP.0TSMH92JN7D8UJV27lOqtPtQUUiK8y59T+smt2TSnl5qm0q3.1jPUn.Ild5HekJwjooE5kSmxq5mBjvN2I1xGrFgdo..fjSXEHuScFTSmjkuO3+XZWYzm9GDdHjv+KlHPE9h3VRLXMaHUs9mqr3hwT82eAyI.cUUBdOQ2gWhb4+s8b6ay7DuipuRgCCxV.b+S.qtF0Ld+OFwfrEVNnAwp6K0ud2m1V2rEZd9k..F8vqIj+uzXnwqpPAqtXp3BW.p9oexf17WChQ8.n8rpHh.Grf7E0gFhRpTz8Fuqf1dfePzWhUAzp1.rljLOxyBig7Jn.c1nVja+PMaxV6GkHtkDiN+6EMNAv2kGXF6YO57pyLGO8uwVFfRPq66Avr8+LDhb1QIpyOMf6+7KQy2nKRHgDvGul2EoE8qypJ62spsNTRgmpCk3m9npZUiMdxSf.9WuHxqXwuC...qLhHE8UFvz8zKr6LOfPuLZiEL6v0qZj8NqcshtLrlsXI5IYG0WESPP3X6o7d57yt7sS.JKtXcF5+vm0LL6N8ugP4UVIrtcQbQR69Jagqt5JJnTwU+pQaHA54YurxJCS+YdV3tUT38i40YUi+6pTgRJrPFce+Zn9FaDodrihy2WI3i29Gh.U3K5VerjUWWbETRk1VkAHVcBXxzz3feYmeu6BA6eGaQu2w8RiMVQUFVyFrostUc9LQYkLRs+KhgxJY58ytJKtX3lmdx4e1UeNaPYkLrdcnngcEnhppBt5pq7l8lR.AHpi3qF5TG.zbp+TiNFV8tquUs0gKblyhqppTF+dpuwFQFEV.95qeMjTpqEwsjXZ6WrF9vGlYwOnAtekAHlkK3.F+Sg7N0YD5kQaH2d6PxqdE5bL0nVMlp+92kwI.lni7O3uCPPbhb6sCGYeoqy+dprJp.S0e+4rnXwjHMnKgLRryspSbnDfsmfBJHjVV6WnWF5kN3.PQEUTam5eEuZnrZB1o4T+ZSXezFO3F+qJ4UiOLo2tCknRfOyTQAmy73Z..Zsx.hN3WPzVdfA3gG3K9xbE5kwCQXgDjN6+5.2Oo.Eqxtpgf9dNja+P0Ymnif3AZmcRuNATiZ0Hp4OeLSV9yuaZqaEi2SO04btfnB2rNORLl7FiOfhhB82wGWnWF5k1b.nlZpAKdwKF6MkMx5m5u1qecTRgmhwm5upZUiTO1Q04F+ZPt81gJ9q+f0Vq7AzN5HFiiOtnzI.JoRQKpa.kekeWnWJODqOgX0a9.n4zThgZs1XgIWmgtZ.MDDevDm..ZUeKdbWbwjiFfleOPeBlEsyN8HymkNWopfCN3.uZSelpuhdkATB.P1YmMdiHiDywsIfUFQDr1o9apgFvkJtX7qmoyUzuGDkWtBj7wNBNeekfjRcsc5F+JK4BXW6MarlMjJVyFRE4WrRQ68p2YDpBEXLN93hxOfDyLeAjwd+bgdY7Pvj6TEf+tWUtfL1ydzauNv66oQBDLuPiS.5pWW.b+nAXLNBTVEUz16UWUOxCtd5JvsaV+kBXM0UOu6.PPAEDJ9pW1jmmZuC2EkCKdy4GClgqiCo8FKh0lz6z7sQUkWFpr7JzaHZpuwFQN+74veXoDnvumFe95eKsNt7N0Yvm+kGAMTWc3eLhGCidjxgWO2SC.fgP0WTfRkrthDx0DpBEX24jC1cN4fPY4RqzTPts1hqe4pQM0Vmn5tA0bmptoHXcNNM4DPl6YOvKO8jmVclFYrm8fnlut0VCMBMCAySnc1Ib1uIKLsYEATVxEz4X0rY9RiMVDn+9ioGP.XLt3Bb3wdrGZb4UPAnnhKFY7oeJic5koQjvbgaUWsvJarQnWFZEKF3.MYMAfZ.CfEWQOLc6xewAuKadO++4UuJtppR0qDMlSIEiqzvMgMi3wvaLmv6zP7qrjKfT15N.8nFNB1Oe5z4aCosGr9XztBbI1IwzSGxs0VQkS.4qTItJtEBSDJzL6ZuYinVxJYzXSNojvanmMVEZXxl+.sJQxj69uqAydwqBYrO9OJa70l+qYCohmt67iCFi1c2zqC.ycCqG6RKcTyxptRVWjcdn4urxv9VexljRvt1CjMVyG9gr3p59Hgs17+Ou5UgxSjGtTw+bmt4+IU8a3iJLer+qUFbalOC9O6JMjbBw1oa9uq8lM15GuSrzHmkN27G.3OtYMl3SfvwphHBjuxeRTcc.SllFe6wzcXDEJBKjfvN1.yNI7RiMVVO4pXSX5l+gOqYP17uKDaOkDw90SuCfsYAQENNaNY0k4j+FBNvh5WiAYWGb.EW40DDayDLYMPPWa7WeiMhbJoXj7wNB1+0JCiNfmF65y9X7gI8158dL20dyFG9q+Frh4ENrhANo3F8SX1TNfZiOZ4wJ5bBHzo3G10dyVnWFZECwIfCb3CC27zSjmdtWT9DM20KS17m1Ym5xWm1OJRfJ7E+1oyUuU3hohb6GJxce6rKaB+wjb.PHYbd5IJuRwQ6Vu8XTN.bmluM9cUpvOdzi0gM9Ud4JPFEV.RS4OhiI4t3WsrG3CS88Yzl9sMGkbAbxBOMd+kybwGZpSZ73Sy4qM3mEwDhMm.lLMMx9.h2elZHNATVEU.e82eLyW4UD7pDPSsYyjj7hoI+HAySZMuNRD4tucpy1IrwN2wsjXvY+lr5RqxeMTm9Sv75t8c3gUh1InfBBGpPwoz.aPN.T60uNtTwEie7nGEWUUo3NM2LT8GUgL+gyhc7S+.xr1a.JESCobnCh8kSNHkTRAV0ytavsWxT15NPLgp6D8p8XkTo3u6l3rlPMDDaNADf6SRzFE.fVcBvPBkplRsZMIkDues.ZN0+3YXUJPYkr6k43lOsmUBFGdMQ2wQ12NQt6amlbDAja+PQxqNV7amNWhfQcO52.4tDoSe3fCNfSJRiNsE5a.M0PC3FUUMpr7xwkqpRnp5pPoUWMtqM8C8ajiDzd6EVlO9n0Rr33G+3HP8b28smcs2rgmiyYFE1+1isC1FnTkJVsULJDnQxfAffmXfgpPAl2lSQTlLfZHPE9hiruzwzlUDcZ2Cr87NqcsXSokFBze+QbqXEcH6pYSJqhJvlSKMjwd1Cic5Pyl+5S6CHz0ButWG4a8IDKN3WeT7E4bTnrjKfxuxU046q0N4maHPE9R9LS6PLTh397LJL58lpuaciCVQsR2p6ne6ca+K1TCMfu86+d7ym+7nrqdEbWa5GjZmcvQmbBt5pqvGe7gQSdBIj.hNjm0f7.Mz4tHj3h+eX73ePtRUUiyV34MoLtTLQpYkIrtuREbm.1cN4fQ5lSh9vHVSs0gYE0BvILBoLl1EWvaDczvKO8jUbFnF0pwAN7gwWbnCoyNvl1fr4Og1SM0VGNWI+RGdcqsxJQ4mS3yp.vVGjC4N04+LHekJQOGKsV22hqqBf1rSYkg0uzkg0YD8TmOH+Sf3iOdNXUAXQ9JUh7KpHnt95fDYRgjd0KXyPFBnoowzm9yaRMPgqWckFzl+GHmih+oyixnsm8CdPXapxxne+hMhI3YJJzIfPUn.uThIH5c.n0MN2YaBDkgfxhKtsDxi1EWf2d5InGyX.sKt.ZWbgQu+xqnBbh7yGmnfBLZgHh1Ymv92wVHg8mvCAkUxD8+9mPgw1Rf4SbvAGPsb2A4MZrn1gOLr7WKBPQQw5S9ca9uMnwezSbRrjveASxlNNR6Q4UVIjaK26UGefFwBZtqKI7QKW3xh2.F+Sgcs2rE0WEfFhaIw.umnaHpEuJ8F5TsgxhKVqaf6sVDUH8o3ZFBgOqYf0mPrj6rk.AVjyUpJLqYLcgdYzV0.Hl1aRxDlzj3jM+A.nj0WCZ7VfVLYaNUObWzlwkFKgpPAddOlrf16.BUgBQcEAzd7ZhtiKd5if3VRLr1bdhBJnC+GaPqY5+lw1SIQxl+DHvxHDx.r1vXpFf7UpDzrXe4o8Xx5..axhdsW1jmC6G7fvOnR2xro4HA3gG3UU7L3Ee62RvRpkXBLXQcEAnMhaIwfKxC0ZswxBhJb7amNWh99Sf.Gg5F0spzxWXrhBDWc.c.QjC.2t4lQK2gcpUSMWCPWMnczQrtnec7losEA44SLqNf5B41aG1dJIJpbDH7YMCbwSmKRlDxeBDLIzmry2OQTH2GoKtHJpJAMHZb.3NM2DqMWS0C2EM0QOaibasEuezuNVdZaQPT9vPmheFbB1IV3AcDXAQENuuwKkUxvBhJbbwSmK1dJIRRzOBDXAZTON.T6eaX4hFWxzm9zwgNIyuFf7JpHSJQ70GhFG.ZVOcMPCA6G7fvEqxzaCihUnjJEe167t3Sy4q4cGclLMcacJPyUjaucH4DhEUe9uC6eGaFgOqYvYNCPYkLDnBewN1v6gpO+2oydeAABDXerYHCQnWBsgqt5pA2hf4xq.PuBADewsYQG...FO8n6RHJP5h0EyqicmSNX4otEip9RMVhInfwxhOIr8TRj2rIWQfJ78d2+dhPYIW.G3dBuBSDeEsgb6GJnc1IP6rSv6I5FozsHPP.QLdUvcmpeLdrbc9KvoN.n9lLOzK8rW8hUs8Tmz3wmjwAAsi72FiBAgpPAx2VawK91uE9nkGqI02oYJxs0VXeusFJK4BhRQHwXQyF2OH4cOQERYIWPqQ8vA6GJjOrVOQOYydBDDWTQUUAu81agdY7P3yT8E4qTIlLCxtetN+E31H.z8dv3gJQB6daDVIUJp5l2fUmSwJSllFO1fGLd43iCIM+X3kndDyLmIhcqeL1wVRhyskPhlM0IatSf.yg1YmPNY90Pgy5WDs3RJuxJg6ThLG.7wG7Ae9hYjC.p43DFjSyA.IVx7S028dXIqa+o3w3MnDtvbF41ZKdrAOX7uyIadIu.njJEALN2wAx4nbtsHPff4EApvWbqgzen5OphWrWsW+5Z80KuxJ4zjnyXfhhBW9lLKGp5tLtMQk4TG.71auaKDp5CK5QOfjt2cV09SaRtiiWzOxpyoXlw33iiHlo+3NRaAyYcqkyK2j.7vCryz2qYcBARf.AtgjSHVjcYpP8M1nfsFDKZ.P6gokCHWl.f.brC.93iO3Dm5rLd78rO8l0WCMfFEU0cIWhmigFmQ44wzlj6XNgGDh58eWNuTAW2biFqIYyyxBj.ABbK6Ls0ic78mVvruXRC.dP71auQAJUpywv0p.Hv8b.vzEfWsCEEEJux+hwiuW8wvjNXlPvJ74QlqAf1QGwun5R.n0Rgbyuy+Kx56yGIld5blMkaqsPVyRfxR55o9hDHPvzfxJYXAKdtHiBEFADqta24hKWKs6q7I93iOHuh9IcNF00WOmFAfVv8b.PcSMvY+PXrtMAT9U9cFM19H0JV29idjCGGS42y5yqXkd1sGNwKWdLQgo779fWZMwyYkDyphHB7Nu+l3j4l.ABl230DcGCaBz7V9.7fzuAN.s95sfV22Cfa2+qynE.zh05d+NkpTo0VXLaYe0M0PqUAf5ZTC0PMmXnwOYOvANTVXAyNb8NVK5QOfk8pmno+lcuyHGGo8c40D.Mz+91QOF8Zhtiw37nwl+2oCYMKAwD7LYc6FS.Ag0rgTY0luCABD5ZPbKIF7RgMe75Cbv7lMyWoRLDGjixpV2G7gK2+SWzyAzeTS802okts55qSuqcSEK..rlxZXsk8lSRH.GFjsX8qd0XAylYiWV+5O9qqwrHFvTB1OePJa8+JnsSW9BZGcDemxRvDncF..szRqg.ixJYHtk85HuScFL2T9.rxWNLVssTNYZZbvBxuKm1.Pf.A1gUD6BQpuyFP3SpisUatfxqrRLpwRCGFTG+24zbBX00nlS2+qynE.3qeSCEbpyh.7vCsNl9ML605Zmsru5lZn0mYt9gOnYNKFWM.8QlLVuZ.rRpTzCo83QhjAzSZZ7cJKosuu41oC1dMQ2wFVW73+dV1O2.VYDQRtJ.BDHnUnc1IHyoQfppk8Os8szRkHUdkU1ogPWBZceO.te+uNy9O2T8SmIostxeA1v9s8by0O7QFYjHi8ePFMVIR5N5MGnlc9NI2djHY.ojJE+8M08UnnIZ.ZxMf70S1nZH1dEu3qZ11rfHPf.2RbKMFrsBxm0m26b6NJk70dGcKu7RZ2W4aj.f+pSVi0Te8cZ9Kvl1m2d1GwncgwICH0.FDqa+IP6Lx9j4w5yqXDKu68E3QMWAf1vqI5Nxb2aCm7JWDKeaowJQHg1QGwc9yax3H9Pf.gGcfxJYH7ndEn7xUv41parr7xyEzbe6iVe8hKsTNuD.A3QG.V3BWH1zN1MiFqE8nGnuVaMquFFG8nDjVnKeiWtN11tF.ljPkwsjXvhV5bQrYrcjZVYZx1eUQDA9vMuCh.AQf.gNPXgDDNdEWhysS+G1v3baXpL5mzYstmz4JUEbvAG3b6yaN.PQQg9OTGX7ICoFvfX8bAHX+7A6JmuhUmSwHdRSibOogcBb41aG1wFWKFmOiGuThIXxWKv5lazXow8dlzbPf.gtlD3K77HmRJlylekpTAq4fCQx17DN+jn3RKsCud4W6Z7hDFyqW+wBW3BQFYcXFMVK5QOfr9YCqZeqjJE+c2ZpKex.RIU5CoG.M0Hy6JidMQ2QlYjFtJtElaJefQ6HfbasEupGOMIe.HPfPGHrPBBWnFsqe+rAWtppDc8..swS7jNiyo5hc3062vrmWrOu5..EEElQHuB10dylQi2JarAVzC1sgENC+7Fe52v8MKGgl92WJT68bz4t2wvylzvBIHrg0Eea4GfwHhPSllljO.DHPPqD3K77bVt.nTkJyBG..z9l8bYE.7fv6I.YPAEDN3wOEiteXIR5NrYvCgUs+nG4vwYU8Kr5bJFwKWcE4VXqJfXyMq6rgsyfxJYHtkDChOgkg+6OTfQ4HvphHBryO4yHRELABDdHBKjfv2WE6p4KZn16zLm2HcXKpuac6g99xqrR3fiijWrsfTADorwMgkkv5XzX6sTYn2xX2xBb7zitKeIANYZZbgRKC..21Hc.PClpi.u+7hFaL0OgjTfDHP3gXDi0YNQW.LGp..MHWt7G5eOs3RKk2hdgf3.fCN3.F6S4Ii6k7CXHCkUSHvf8ymGIJIPKgk.P2kBngP6cDXtqecLJGAnjJEq7EeULqHIxDLABDtOgGxLPN+L6mLflCU.fFb0UWQEUc+9j.W1C.ZOBkFHfEsnEgc+EeCiuJfALD6XU6OhQZGm0bbDKLtQNJ7KkdoNnFflJZbDXCIu51RVvcmityqB41ZKVaTykTY.DHPnMjauc3VxX21.uRUpfb4xY04jKwUWcE4UTQs8801s6xa1Vvb...3+jdF3es3Uxnw1aoxXUsAHX+7AaNy8wZymXjIeOYA91M2DmL+TVICgERP3S115Q++GCEyayofDSO8NsJKnczQ7xOk2Dm.HPfPanvumlU6Tf7YHzYCnnnf5Fansuu6Rkwa1VPc.fhhBgNunYbohYyfsEV1qdxJ11JoRQU0e8tzkDnbasEUW0Mvsa91btsBTguXGaII7ZQGJR5.6CKeaoo0qGf1QGg+tLdL6EuJNeMQf.AwOO+y3KJ7hcrT3LVJuxJMqb...ne2qwroTkJ353+m7lcETG...lvjlD5tUCjQ4CfDIcG8mEyGfEDQHH0LMckuSLik20BTa80aPZAfofb6sCImPrHkTR.WE2BuYFaGIld5Oz0sLYZZLuo9bjHAPf.APYkLTqkrWNdwmgPmsPSY+w2QuPvc...H93iGEn72XTohYYO6EqkO.1O3Agqcy+rKcT.ddOmL9tycdiRK.LUBKjfvFRbU30hNT7UWTIl6FSFolUln7JqrsqCHpEtBR0APfvi337XeRTei5W1xYB7YHzYKzz3eNW4W5QOG...hOg2Au6l2Ni1Ln2RkAqGv.YE656jbqKsv.MYZZbVkmGMbqaIXqA41aGVvrCGeRZqCOcfSAa8XeEdo0DOJ3bJQ.ztgkD6ZH5D.ABOBi2SzMTZ0ldd.vm0POah0VaMTpREpGcS+ClEQz3..EEE14t9TLmkEOibBfZ.CjURJvIP6bWdgApw5ahyRDPCEZmcBImPrHycuMLivBBWok5g55qGSaVQfMu8LD5kGABDD.FiyilUTEPysD.TCt5pq3xUUEF9nchWsqnwA.fVcBX0ItVFKRPCXHCEG8z+fIa2olbquDB..CvRRDEDU6mW5sL1Lmwa5wge9BrWR1vVnIx.YlQZ32Nctf1Y98C+DHPPb.kUxPyVZ5x9NeVC8rM4UzOAu81ad0lhJG..Z0SnEG6agkxPm.5Qejgr9liaR1bBzNibUdVSZNDyDfGdfCdjiKzKCcBkUxfWSzcgdYPf.AAh9eu6A2T3xpuAKrR3eb0UWQpYkIu67hnyA.fV+gw+J5ExHm.BKjfv.r0NS1IfwSO5trQAfRpTTcUWm2pD.BDHPvP4tx5iIOGRLCS.PfVi9sPD4BQoC..7uS.A6mOH8bXVqJ1bjQNX6wkJ+xB8xf.ABDzJTVaZadWdkUxq0POaS7wGOuaSQqC..FmS.6LqCYz1a5J7lQZau4HA3gGH+S+8B8xf.ABD3DLWS.PMPh.fVvPcBXDNNJ7lqaKFksZMJ.eoQ8dE6P6ni3mOu3KQ.IPf.A..Grenljj.aNm.fBEhdG..tuS.ydowo2RDLrPBBQOmHwZ2VFnViPfebkdTcYiBvcuk3nT.IPf.g1i7gYGt4eabhAjLarwrTA.EZLKb..39UGvrlyB0qS.dMQ2w7mSjXUo7wFrS.ckiBfOtNNF2BlIPf.A9jxu7ui9ZB85EyQE.TnwrwA.fVcBH6C8UXYuaJn7q765brzN6DxXqa.K581L9kRujgYG5QgCcxSZJKUQIA3gG3DE10sbGIPff4KkckqBGG3fMp264JkeahNcUvrxA.fVKWhMl5Vw+66sQ8JerTVICGMqcg8magFTEBDre9fMl4mYhqTwI28lridaSf.ABhEJVk4cB.JTX14..PqNA74ewAvmd3uE6ZuYq2wu8TRDCvV6Ln7BHzY9rcI0EfGq+Cjn69DHPPzweU8eYzuWkkph3.fQfD.fVDHi2R69pgRJabSn1t0arz3SRuiMrPBByeNQh31zmvnqDXZSx8tjpCX.SxCj2oNiPuLHPf.gGBKZ51F86kZDC2feOl59OlJhA6KA.PcSMv6KhVtmcMU6unEsHDbnuFipP.ZmcBYmw1vY+0xvlxXu5MZ.cE6Q.xs0VboRM8ltAABDHvlT0UulQ89puwFQ+G1vLn2Cas+iwhXw9++.JPZFBsey6j.....jTQNQjqBAlf" ],
					"embed" : 1,
					"forceaspect" : 1,
					"id" : "obj-16",
					"maxclass" : "fpic",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "jit_matrix" ],
					"patching_rect" : [ 27.0, 22.0, 178.0, 178.0 ],
					"pic" : "Macintosh HD:/Users/atsukotominaga/Downloads/yuzuko.png",
					"presentation" : 1,
					"presentation_rect" : [ 28.0, 29.333344000000011, 178.0, 178.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"order" : 0,
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"hidden" : 1,
					"midpoints" : [ 296.5, 108.166672000000005, 226.5, 108.166672000000005 ],
					"order" : 1,
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"order" : 0,
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"hidden" : 1,
					"midpoints" : [ 257.5, 54.833344000000011, 226.5, 54.833344000000011 ],
					"order" : 1,
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"order" : 0,
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"hidden" : 1,
					"midpoints" : [ 296.5, 81.666672000000005, 226.5, 81.666672000000005 ],
					"order" : 1,
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 0 ],
					"source" : [ "obj-24", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"hidden" : 1,
					"midpoints" : [ 226.5, 294.666687000000024, 257.5, 294.666687000000024 ],
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "yuzuko.png",
				"bootpath" : "~/Downloads",
				"patcherrelativepath" : "../../../../../../Downloads",
				"type" : "PNG",
				"implicit" : 1
			}
 ],
		"autosave" : 0
	}

}
