
ROM=out/rom
OUT=rom-strings

for file in `find $ROM -type f -exec grep -Iq . {} \; -print`;do
    filefolder="$(dirname $file)"
    filename="$(basename $file)"
    outfolder=$OUT/${filefolder#$ROM*}
    mkdir -p $outfolder
    cp $file $outfolder/$filename
done

for file in `find $ROM -type f -size 0c -o -size 1c`;do
    filefolder="$(dirname $file)"
    filename="$(basename $file)"
    outfolder=$OUT/${filefolder#$ROM*}
    mkdir -p $outfolder
    cp $file $outfolder/$filename
done

for file in `find $ROM -type f -size +1c ! -name "*.apk" ! -name "*.jar" ! -name "*.art" ! -name "*.oat" ! -name "*.odex" ! -name "*.vdex" ! -name "*.fsv_meta" ! -exec grep -Iq . {} \; -print`; do
    filefolder="$(dirname $file)"
    filename="$(basename $file)"
    outfolder=$OUT/${filefolder#$ROM*}
    mkdir -p $outfolder
    strings "$file" > "$outfolder/$filename.strings"
done

chmod -R a+r $OUT

