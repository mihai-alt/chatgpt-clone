@echo off
setlocal EnableDelayedExpansion

:: words
set verbs[0]=add
set verbs[1]=fix
set verbs[2]=update
set verbs[3]=refactor
set verbs[4]=remove
set verbs[5]=optimize
set verbs[6]=create
set verbs[7]=implement
set verbs[8]=cleanup
set verbs[9]=improve

set words[10]=river
set words[11]=ember
set words[12]=vortex
set words[13]=pulse
set words[14]=matrix
set words[15]=signal
set words[16]=glitch
set words[17]=flux
set words[18]=nova
set words[19]=orbit
set words[20]=emberly
set words[21]=lunar
set words[22]=spark
set words[23]=prism
set words[24]=nebula
set words[25]=aurora
set words[26]=echo
set words[27]=zenith
set words[28]=ripple
set words[29]=chronos
set words[30]=axis
set words[31]=cascade
set words[32]=drift
set words[33]=glow
set words[34]=horizon
set words[35]=ignite
set words[36]=jet
set words[37]=kismet
set words[38]=lumen
set words[39]=mosaic
set words[40]=opal
set words[41]=quasar
set words[42]=radiant
set words[43]=solace
set words[44]=tide
set words[45]=unison
set words[46]=blaze
set words[47]=comet
set words[48]=shard
set words[49]=aurorae

:: Year
set year=2020

for /L %%i in (1,1,24) do (

    set /a r=!random! %% 50
    set /a v=!random! %% 10
    call set word=%%words[!r!]%%
    call set verb=%%verbs[!v!]%%

    if %%i==24 (
        set msg=final commit
    ) else (
        set msg=!verb! !word!
    )

    :: Random date between Oct 5 and Dec 10
    set /a offset=!random! %% 102

    if !offset! LSS 23 (
        set month=1
        set /a day=9 + offset
    ) else if !offset! LSS 52 (
        set month=2
        set /a day=offset - 22
    ) else if !offset! LSS 83 (
        set month=3
        set /a day=offset - 51
    ) else (
        set month=4
        set /a day=offset - 82
    )

    :: Random time
    set /a hour=!random! %% 24
    set /a minute=!random! %% 60

    if !hour! LSS 10 set hour=0!hour!
    if !minute! LSS 10 set minute=0!minute!
    if !day! LSS 10 set day=0!day!
    if !month! LSS 10 set month=0!month!

    set commitdate=!year!-!month!-!day!T!hour!:!minute!:00

    echo commit %%i >> commits.txt

    git add .

    set GIT_AUTHOR_DATE=!commitdate!
    set GIT_COMMITTER_DATE=!commitdate!

    git commit -m "!msg!" --date "!commitdate!"

    echo %%i / 24 - !msg! - !commitdate!
)