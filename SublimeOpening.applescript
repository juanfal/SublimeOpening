-- juanfal SublimeOpening.applescript
-- 2010-06-25
on run {input, parameters}
	
    tell application "Finder" to set selectedItems to selection
	if selectedItems is not {} then
	    set allPaths to ""
	    repeat with bob in selectedItems
	        set fn to POSIX path of (bob as alias)
			set allPaths to allPaths & " " & (quoted form of fn)
	    end repeat
	else
	    tell application "Finder"
	      try
	        set allPaths to get the POSIX path of (folder of the front window as string)
	      on error
	        set allPaths to get the POSIX path of (path to desktop folder as string)
	      end try
		  set allPaths to (quoted form of allPaths)
	    end tell
	end if
	do shell script "/Users/juanfc/bin/subl -n " & allPaths
	
	return input
end run
