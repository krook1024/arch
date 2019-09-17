if exists("b:did_indent")
    finish
endif

runtime! indent/xml.vim

if exists('*XmlIndentGet')
    setlocal indentexpr=XmlIndentGet(v:lnum,1)
endif
