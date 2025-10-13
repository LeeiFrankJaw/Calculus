ClearAll["`*"]

f[n_] := n Sin[n]
g[n_] := Sin[n^n/4]
h[n_] := n Sin[n^n/2]

defns = {
        f //Definition,
        g //Definition,
        h //Definition
}

SetOptions[ListPlot, ImageSize -> Large]

cmpts = {
        (* SystemInformation[] //HoldForm, *)
        ListPlot[Table[Sin[n], {n,10}]] //HoldForm,
        ListPlot[Table[Sin[n], {n,1000}]] //HoldForm,
        ListPlot[Table[f[n], {n,10}]] //HoldForm,
        ListPlot[Table[f[n], {n,1000}]] //HoldForm,
        ListPlot[Table[g[n], {n,10}]] //HoldForm,
        ListPlot[Table[Block[{$MaxExtraPrecision = 1000000}, N[g[n], 10]],
                       {n,1000}]] //HoldForm,
        ListPlot[Table[h[n], {n,10}]] //HoldForm,
        ListPlot[Table[Block[{$MaxExtraPrecision = 1000000}, N[h[n], 10]],
                       {n,1000}]] //HoldForm
}

rslts = ReleaseHold/@cmpts;

cmptRslts = {cmpts, rslts} //Transpose//Flatten;

cells = Cell@*BoxData@*ToBoxes/@Join[defns, cmptRslts];

nb = Notebook[cells, PrintingOptions -> {"PaperSize" -> {8.27*72, 11.69*72}}];

Export["sinnn.nb", nb]
Export["sinnn.pdf", nb]

Export["sinnn_1.pdf", rslts[[2]]]
Export["sinnn_2.pdf", rslts[[4]]]
Export["sinnn_3.pdf", rslts[[6]]]
Export["sinnn_4.pdf", rslts[[8]]]
