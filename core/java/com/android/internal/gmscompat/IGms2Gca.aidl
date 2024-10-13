package com.android.internal.gmscompat;

import android.app.ApplicationErrorReport;
import android.app.Notification;
import android.app.PendingIntent;
import android.content.Intent;
import android.database.IContentObserver;
import android.os.BinderDef;

import com.android.internal.gmscompat.GmsCompatConfig;
import com.android.internal.gmscompat.IGca2Gms;
import com.android.internal.gmscompat.dynamite.server.IFileProxyService;

// calls from GMS components to GmsCompatApp
interface IGms2Gca {
    GmsCompatConfig connectGmsCore(String processName, IGca2Gms iGca2Gms, @nullable IFileProxyService dynamiteFileProxyService);
    GmsCompatConfig connect(String packageName, String processName, IGca2Gms iGca2Gms);

    @nullable BinderDef maybeGetBinderDef(String callerPkg, int processState, String ifaceName);

    oneway void onPlayStorePendingUserAction(in Intent actionIntent, @nullable String pkgName);
    @nullable Intent maybeGetPlayStorePendingUserActionIntent();

    oneway void showPlayStoreMissingObbPermissionNotification();

    oneway void startActivityFromTheBackground(String callerPkg, in PendingIntent intent);

    oneway void showGmsCoreMissingPermissionForNearbyShareNotification();

    oneway void showGmsCoreMissingNearbyDevicesPermissionGeneric();

    oneway void showMissingPostNotifsPermissionNotification(String callerPkg);

    oneway void maybeShowContactsSyncNotification();

    void onUncaughtException(in ApplicationErrorReport aer);
    GmsCompatConfig requestConfigUpdate(String reason);

    @nullable String privSettingsGetString(String ns, String key);
    boolean privSettingsPutString(String ns, String key, @nullable String value);
    boolean privSettingsPutStrings(String ns, in String[] keys, in String[] values);
    void privSettingsRegisterObserver(String ns, String key, IContentObserver observer);
    void privSettingsUnregisterObserver(IContentObserver observer);

    Notification getMediaProjectionNotification();

    boolean setupWorkProfileGms(int workUser, int callingUser, in String[] adminPkgs);
}
