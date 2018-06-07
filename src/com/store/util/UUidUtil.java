package com.store.util;


import java.util.UUID;

public class UUidUtil {
    public static String getUUid(){
        String uuid = UUID.randomUUID().toString();
        uuid = uuid.replace("-","");
        return uuid;
    }
}
