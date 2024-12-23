export class FetchManager {
    static ongoingCalls = new Map();

    static isCallOngoing(key) {
        return FetchManager.ongoingCalls.has(key);
    }

    static startCall(key) {
        FetchManager.ongoingCalls.set(key, true);
    }

    static endCall(key) {
        FetchManager.ongoingCalls.delete(key);
    }
}