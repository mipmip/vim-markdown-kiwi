

"TODO deprecation
let g:wimpi_dirs_root = '/Users/pim/Sys/wimpi-projects-dirs'

let g:wimpi_debug = 0


let g:wimpi_index_cli_command = 'cd $HOME/.vim/wimpi-script/ && rvm 2.5.1 do ruby ./make_wiki_index.rb'

call wimpi#Init()

command! -nargs=+ WimpiGrep :call wimpi#grep(<f-args>)
command! -nargs=+ WimpiDoc :call wimpimenu#new_document_in_leaf(<f-args>)

command! WimpiArchive :call wimpi#move_to('ARCHIVE')
command! WimpiTrash :call wimpi#move_to('TRASH')

let awkMissingFrontMatterCommand = "/usr/bin/awk 'FNR>1 {nextfile} /---/ { nextfile  } {print FILENAME". '"' . "|0| missing Front Matter" . '"' . "}' ".g:wimpi_root_path."/wiki/*.md"
command! WimpiMissingFrontMatter :cexpr system(awkMissingFrontMatterCommand)

command! WimpiMenuOpen :call wimpimenu#open()
command! WimpiMenuClose :call wimpimenu#close()

" VALIDATE Wimpi Links
augroup MarkdownTasks
  autocmd BufEnter,WinEnter,BufWinEnter *.md call wimpi_mdlangext#FindNonExistingLinks()
augroup END
