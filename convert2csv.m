myDir = 'target_dir';
myFiles = dir(fullfile(myDir));
for k=1:length(myFiles)
	baseFileName = myFiles(k).name;
	fullFileName = fullfile(myDir, baseFileName);
	[fPath, fName, fExt] = fileparts(fullFileName);
	switch lower(fExt)
		% A MAT file
		case '.mat'
		fprintf(1, 'Converting into csv: %s\n', strcat(fName,'.csv'));
		FileData = load(fullFileName);
		writetable(FileData.Data,strcat(fName,'.csv'),'Encoding','Shift_JIS');
		case '.csv'
		% A Text file
		otherwise  % Under all circumstances SWITCH gets an OTHERWISE!
		fprintf(1, 'Unexpected file extension: %s\n', fExt);
	end
end
