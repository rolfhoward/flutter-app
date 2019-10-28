package com.lenovo.flutter_app.utils

import java.security.MessageDigest

class MD5Utils {

    companion object {
        fun encrypt(dataStr: String): String {
            var dataStr = dataStr
            try {
                val m = MessageDigest.getInstance("MD5")
                m.update(dataStr.toByteArray(charset("UTF8")))
                val s = m.digest()
                val md5StrBuff = StringBuffer()

                for (i in 0 until s.size) {
                    if (Integer.toHexString(0xFF and s[i].toInt()).length == 1)
                        md5StrBuff.append("0").append(Integer.toHexString(0xFF and s[i].toInt()))
                    else
                        md5StrBuff.append(Integer.toHexString(0xFF and s[i].toInt()))
                }

                return md5StrBuff.toString()
            } catch (e: Exception) {
                e.printStackTrace()
            }

            return ""
        }
    }
}