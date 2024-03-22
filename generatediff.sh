for filename in $(ls .)
    if test -z $(string match -r '\S+[^diff,^v0,^backup,^response][.]tex' $filename)
    else
        echo $filename
        set name $(string split . $filename)[1]
        latexdiff --math-markup=1 $PWD/$(string join '' $name "_v0.tex") $PWD/$filename > $PWD/$(string join '' $name "_diff.tex")
    end
end
