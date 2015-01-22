tell application "Notes"
	activate
	set theURL to "{popclip browser url}"
	--set formatURL to "<pre><a href=\"" & theURL & "\">" & theURL & "</a></pre>"
	set theTitle to "{popclip browser title}"
	set theText to "{popclip html}"
	set noteHTMLText to "<pre><h3><a href=\"" & theURL & "\">" & (theTitle as Unicode text) & "</a></h3><div>" & (theText as Unicode text) & "</div></pre>"
	
	set theAccount to name of first account
	tell account theAccount
		set theFolder to name of first folder
		set myNote to (make new note at folder theFolder with properties {body:noteHTMLText})
		set name of myNote to first paragraph of theTitle
	end tell
end tell