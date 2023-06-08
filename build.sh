# AMap3DMap-NO-IDFA (9.6.0)
curl https://a.amap.com/lbs/static/zip/AMap_iOS_3DMap_Lib_V9.6.2.zip -o AMap3DMap-NO-IDFA.zip
unzip AMap3DMap-NO-IDFA.zip -d AMap3DMap-NO-IDFA

xcframeworkName="MAMapKit"
bundleName="AMap"

function process {
    L_PATH=$1
    OUTPUT_PATH=$2
    lipo $L_PATH/$xcframeworkName.framework/$xcframeworkName -thin arm64 -output $L_PATH/$xcframeworkName-arm64
    lipo $L_PATH/$xcframeworkName.framework/$xcframeworkName -thin x86_64 -output $L_PATH/$xcframeworkName-x86_64
    lipo $L_PATH/$xcframeworkName.framework/$xcframeworkName -thin arm64 -output $L_PATH/$xcframeworkName-sim-arm64

    mkdir $L_PATH/o
    
    cd $L_PATH/o

    ar x ../$xcframeworkName-sim-arm64

    ../../script.sh ./ arm64 9.0 15.5
        
    ar crv ../$xcframeworkName-sim-arm64 ./*.o
    
    cd ../../

#    lipo -create -output $L_PATH/$xcframeworkName-arm64 $L_PATH/$xcframeworkName-arm64A
    lipo -create -output $L_PATH/$xcframeworkName-arm64_x86_64 $L_PATH/$xcframeworkName-sim-arm64 $L_PATH/$xcframeworkName-x86_64

    mkdir $L_PATH/iphone-os $L_PATH/iphone-sim
    cp -r $L_PATH/$xcframeworkName.framework $L_PATH/iphone-os
    cp -r $L_PATH/$xcframeworkName.framework $L_PATH/iphone-sim

    cp $L_PATH/$xcframeworkName-arm64 $L_PATH/iphone-os/$xcframeworkName.framework/$xcframeworkName
    cp $L_PATH/$xcframeworkName-arm64_x86_64 $L_PATH/iphone-sim/$xcframeworkName.framework/$xcframeworkName

    rm -rf $OUTPUT_PATH/*

    xcodebuild -create-xcframework -framework $L_PATH/iphone-os/$xcframeworkName.framework -framework $L_PATH/iphone-sim/$xcframeworkName.framework -output $OUTPUT_PATH/$xcframeworkName.xcframework
    cp -r $L_PATH/MAMapKit.framework/$bundleName.bundle $OUTPUT_PATH/
#    zip -r $OUTPUT_PATH.zip $OUTPUT_PATH
    cd $OUTPUT_PATH
    zip -r $L_PATH.zip $xcframeworkName.xcframework
    mv $L_PATH.zip ../$L_PATH.zip
    cd ../../
}


process 'AMap3DMap-NO-IDFA' './output/AMap3DMap-NO-IDFA'
