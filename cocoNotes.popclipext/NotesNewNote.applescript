tell application "Notes"
	activate
	set theURL to "{popclip browser url}"
	set theTitle to "{popclip browser title}"
	if theURL = "" then
		set theText to "{popclip text}"
		set noteTitle to first paragraph of theText
	else
		set theHTMLText to "{popclip html}"
		set theText to "<pre><h3><a href=\"" & theURL & "\">" & (theTitle as Unicode text) & "</a></h3><div>" & (theHTMLText as Unicode text) & "</div></pre>"
		set noteTitle to theTitle
	end if
	set theAccount to name of first account
	tell account theAccount
		set theFolder to name of first folder
		set myNote to (make new note at folder theFolder with properties {body:theText})
		set name of myNote to noteTitle
	end tell
end tell