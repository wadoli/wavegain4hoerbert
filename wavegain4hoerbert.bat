@echo off

REM CC0 - To the extent possible under law, wadoli has waived all copyright
REM and related or neighboring rights to wavegain4hoerbert. This work is
REM published from: Switzerland.
REM
REM Use at your own risk and make backups before running this command on your
REM audio files!
REM
REM This command will recursively check and change (lossy) all WAV files
REM contained within so their perceived loudness is consistent.
REM
REM It only accepts one directory as argument.
REM
REM The actual work is done by WaveGain, see
REM https://github.com/MestreLion/wavegain
REM
REM Tested with WaveGain v1.3.1 ICL12.1 compile by John33 downloaded from
REM https://www.rarewares.org/others.php#wavegain
REM
REM A logfile (wavegain.log) will be written/appended in the given directory.

if exist "%~1\*" (

	REM Wavegain writes a wavegain.tmp file in the "current running" directory
	REM which thus needs to be writeable, see
	REM https://hydrogenaud.io/index.php?topic=87954.0;last_msg=754438
	PUSHD "%TEMP%"
	REM 
	for /R "%~1" %%f in (*.wav) do WaveGain.exe --apply --logfile "%~1\wavegain.log" "%%f"
	POPD

	) else (

        echo The given argument isn't a valid directory path.
		pause

    )