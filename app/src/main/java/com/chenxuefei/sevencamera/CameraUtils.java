package com.chenxuefei.sevencamera;

import android.content.Context;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Environment;
import android.support.annotation.NonNull;

import java.io.File;

/**
 * Created by chenxuefei on 2018/2/13.
 */

public class CameraUtils {

    public static void shootSound(Context context) {
        AudioManager meng = (AudioManager) context.getSystemService(Context.AUDIO_SERVICE);
        int volume = meng.getStreamVolume( AudioManager.STREAM_NOTIFICATION);

        if (volume != 0) {
            MediaPlayer shootMP = MediaPlayer.create(context, Uri.parse("file:///system/media/audio/ui/camera_click.ogg"));
            if (shootMP != null)
                shootMP.start();
        }
    }


    @NonNull
    public static File createMediaPictureFile() {
        File baseCameraPath =
                new File(
                        Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DCIM).getAbsolutePath(),
                        "SevenCamera"
                );

        if (!baseCameraPath.exists()) {
            baseCameraPath.mkdir();
        }
        String fileName = "DC_" + System.currentTimeMillis() + ".jpg";
        return new File(baseCameraPath, fileName);
    }


}
