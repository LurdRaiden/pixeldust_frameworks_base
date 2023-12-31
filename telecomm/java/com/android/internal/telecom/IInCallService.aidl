/*
 * Copyright (C) 2014 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.android.internal.telecom;

import android.app.PendingIntent;
import android.os.Bundle;
import android.telecom.CallAudioState;
import android.telecom.CallEndpoint;
import android.telecom.ParcelableCall;

import com.android.internal.telecom.IInCallAdapter;

/**
 * Internal remote interface for in-call services.
 *
 * @see android.telecom.InCallService
 *
 * {@hide}
 */
oneway interface IInCallService {
    void setInCallAdapter(in IInCallAdapter inCallAdapter);

    void addCall(in ParcelableCall call);

    void updateCall(in ParcelableCall call);

    void setPostDial(String callId, String remaining);

    void setPostDialWait(String callId, String remaining);

    void onCallAudioStateChanged(in CallAudioState callAudioState);

    void onCallEndpointChanged(in CallEndpoint callEndpoint);

    void onAvailableCallEndpointsChanged(in List<CallEndpoint> availableCallEndpoints);

    void onMuteStateChanged(boolean isMuted);

    void bringToForeground(boolean showDialpad);

    void onCanAddCallChanged(boolean canAddCall);

    void silenceRinger();

    void onConnectionEvent(String callId, String event, in Bundle extras);

    void onRttUpgradeRequest(String callId, int id);

    void onRttInitiationFailure(String callId, int reason);

    void onHandoverFailed(String callId, int error);

    void onHandoverComplete(String callId);
}
