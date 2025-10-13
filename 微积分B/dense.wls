ClearAll["`*"]

f[n_] := FractionalPart[n^n Pi]

defns = {f //Definition}

SetOptions[ListPlot, ImageSize -> Large]

cmpts = {
        ListPlot[Table[Block[{$MaxExtraPrecision = 1000000}, N[f[n], 10]], {n,1000}]] //HoldForm,
        ListPlot[Table[n Sin[n/2]^n, {n,1000}]] //HoldForm
}

rslts = ReleaseHold/@cmpts;

cmptRslts = {cmpts, rslts} //Transpose//Flatten;

cells = Cell@*BoxData@*ToBoxes/@Join[defns, cmptRslts];

nb = Notebook[cells, PrintingOptions -> {"PaperSize" -> {8.27*72, 11.69*72}}];

Export["dense.pdf", nb]
