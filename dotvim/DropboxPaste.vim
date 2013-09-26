

if exists("g:loaded_dropbox_paste")
  finish
endif
let g:loaded_dropbox_paste = 1


let g:dropboxRootUrl = ""
let g:dropboxLocalPath = "/Users/aaron/Dropbox"
let g:dropboxRelativePasteDir = "Paste"
let g:dropboxPasteForceUrlRoot = ""


fun! PasteToDropbox()

  let bufferName = bufname("%")
  let originalFileName =  fnamemodify(bufferName, ":t")

  let outFilePathRoot = g:dropboxLocalPath."/Public/".g:dropboxRelativePasteDir

  let outFilePath = ""
  let ver = 0
  while 1
    let outFilePath = outFilePathRoot."/".originalFileName."_".string(ver).".html"
    let ver+=1
    if !filereadable(outFilePath)
      break
    endif
  endw

  let fileName = fnamemodify(outFilePath, ":t")

  if g:dropboxPasteForceUrlRoot != ""
    let root = g:dropboxPasteForceUrlRoot."/".fileName
  else
    let root = g:dropboxRootUrl."/".g:dropboxRelativePasteDir."/".fileName
  endif

  let @+ = root
  let @* = root

  echo fileName
  TOhtml

  exec "%s/\\(<title>\\).*\\(<\\/title>\\)/\\1".originalFileName." - version ".string(ver)."\\2/g"

  execute "w! ".outFilePath
  wincmd q
  execute "bd! ".bufferName.".html"
endf

command! DropboxPaste :call PasteToDropbox()
