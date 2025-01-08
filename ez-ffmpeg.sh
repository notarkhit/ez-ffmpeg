#!/bin/bash

formats=(
    "3dostr" "3g2" "3gp" "4xm" "a64" "aa" "aac" "ac3" "acm" "act" "adf" "adp" "ads" "adts" "adx" "aea" "afc" "aiff" "aix" "alaw" "alias_pix" "amr" "amrnb" "amrwb" "anm" "apc" "ape" "apng" "aptx" "aptx_hd" "aqtitle" "asf" "asf_o" "asf_stream" "ass" "ast" "au" "avi" "avm2" "avr" "avs" "avs2" "bethsoftvid" "bfi" "bfstm" "bin" "bink" "bit" "bmp_pipe" "bmv" "boa" "brender_pix" "brstm" "c93" "caf" "cavsvideo" "cdg" "cdxl" "cine" "codec2" "codec2raw" "concat" "crc" "dash" "data" "daud" "dcstr" "dds_pipe" "dfa" "dhav" "dirac" "dnxhd" "dpx_pipe" "dsf" "dsicin" "dss" "dts" "dtshd" "dv" "dvbsub" "dvbtxt" "dvd" "dxa" "ea" "ea_cdata" "eac3" "epaf" "exr_pipe" "f32be" "f32le" "f4v" "f64be" "f64le" "fbdev" "ffmetadata" "fifo" "fifo_test" "film_cpk" "filmstrip" "fits" "flac" "flic" "flv" "framecrc" "framehash" "framemd5" "frm" "fsb" "g722" "g723_1" "g726" "g726le" "g729" "gdv" "genh" "gif" "gif_pipe" "gsm" "gxf" "h261" "h263" "h264" "hash" "hcom" "hds" "hevc" "hls" "hnm" "ico" "idcin" "idf" "iff" "ifv" "ilbc" "image2" "image2pipe" "ingenient" "ipmovie" "ipod" "ircam" "ismv" "iss" "iv8" "ivf" "ivr" "j2k_pipe" "jacosub" "jpeg_pipe" "jpegls_pipe" "jv" "kux" "latm" "lavfi" "live_flv" "lmlm4" "loas" "lrc" "lvf" "lxf" "m4v" "matroska" "matroska" "webm" "md5" "mgsts" "microdvd" "mjpeg" "mjpeg_2000" "mkvtimestamp_v2" "mlp" "mlv" "mm" "mmf" "mov" "mov" "mp4" "m4a" "3gp" "3g2" "mj2" "mp2" "mp3" "mp4" "mpc" "mpc8" "mpeg" "mpeg1video" "mpeg2video" "mpegts" "mpegtsraw" "mpegvideo" "mpjpeg" "mpl2" "mpsub" "msf" "msnwctcp" "mtaf" "mtv" "mulaw" "musx" "mv" "mvi" "mxf" "mxf_d10" "mxf_opatom" "mxg" "nc" "nistsphere" "nsp" "nsv" "null" "nut" "nuv" "oga" "ogg" "ogv" "oma" "opus" "oss" "paf" "pam_pipe" "pbm_pipe" "pcx_pipe" "pgm_pipe" "pgmyuv_pipe" "pictor_pipe" "pjs" "pmp" "png_pipe" "ppm_pipe" "psd_pipe" "psp" "psxstr" "pva" "pvf" "qcp" "qdraw_pipe" "r3d" "rawvideo" "realtext" "redspark" "rl2" "rm" "roq" "rpl" "rsd" "rso" "rtp" "rtp_mpegts" "rtsp" "s16be" "s16le" "s24be" "s24le" "s32be" "s32le" "s337m" "s8" "sami" "sap" "sbc" "sbg" "scc" "sdp" "sdr2" "sds" "sdx" "segment" "ser" "sgi_pipe" "shn" "siff" "singlejpeg" "sln" "smjpeg" "smk" "smoothstreaming" "smush" "sol" "sox" "spdif" "spx" "srt" "stl" "stream_segment" "ssegment" "subviewer" "subviewer1" "sunrast_pipe" "sup" "svag" "svcd" "svg_pipe" "swf" "tak" "tedcaptions" "tee" "thp" "tiertexseq" "tiff_pipe" "tmv" "truehd" "tta" "tty" "txd" "ty" "u16be" "u16le" "u24be" "u24le" "u32be" "u32le" "u8" "uncodedframecrc" "v210" "v210x" "vag" "vc1" "vc1test" "vcd" "vidc" "Video4Linux2" "v4l2" "vividas" "vivo" "vmd" "vob" "vobsub" "voc" "vpk" "vplayer" "vqf" "w64" "wav" "wc3movie" "webm" "webm_chunk" "webm_dash_manifest" "webp" "webp_pipe" "webvtt" "wsaud" "wsd" "wsvqa" "wtv" "wv" "wve" "xa" "xbin" "xmv" "xpm_pipe" "xvag" "xwd_pipe" "xwma" "yop" "yuv4mpegpipe"
)

function ffmpeg_function(){
    ffmpeg -i $filename.$extension -c:v libwebp -vf "fps=30,scale=1920:-1" -lossless 0 -q:v 80 $outputFile
}

function main (){
    if [[ -e "$1" ]]; then
        base_filename=$(basename $1)
        filename=${base_filename%.*}
        extension=${base_filename##*.}
        extention_choice=$(printf "%s\n" ${formats[@]} | fzf --wrap --cycle --ansi --reverse --header="Choice an extension:")
        echo $extention_choice

        if ! [ -z $extention_choice ]; then
            outputFile="${filename}.${extention_choice}"
            echo $outputFile
            if ! printf "%s\n" ${formats[@]} | grep -qx "$extension" ; then
                echo -e "\033[38;5;1mFILE FORMAT NOT SUPPORTED.\033[0m"
                exit 1
            fi

            # Calling the ffmpeg function here -
            ffmpeg_function

            echo -e "\033[38;5;2mSaved the output file at: $(pwd)/$outputFile\033[0m"
        fi
    else
        echo -e "\033[38;5;1mIncorrect file path !!!\033[0m"
    fi
}

main $1

# Have fun now 😉.
