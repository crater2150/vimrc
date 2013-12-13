let g:Powerline#Segments#custom#segments = Pl#Segment#Init(['custom',
	\ Pl#Segment#Create('fileinfo',
		\ Pl#Segment#Create('flags.ro'    , '%{&readonly ? "$RO" : ""}'),
		\ Pl#Segment#Create('filename'    , '%t'),
		\ Pl#Segment#Create('flags.mod'   , '%M'),
		\ Pl#Segment#Create('flags.type'  , '%H%W'),
	\ ),
\ ])
