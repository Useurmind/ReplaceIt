# ReplaceIt

Small tool to replace text.

# Usage

There are three scripts to use:

- `replace-filenames`: Replace text in the names of files and folders (!) under the directory given (recursive)
- `replace-infiles`: Replace text in the content of files under the directory given (recursive)
- `replace`: Executes `replace-filenames` and `replace-infiles` with the same arguments

Switch to folder where you cloned it:

    replace.ps1 -rootFolder <folderToReplaceStuffIn> -regex <regexToSearchFor> -replacement <textToReplaceRegexMatchesWith>