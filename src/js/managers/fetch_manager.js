export class FetchManager {
    static ongoingCalls = new Map();
    static style = null;

    static isCallOngoing(key) {
        let style = FetchManager.style;

        if(!style){
            style = document.createElement("style");
            FetchManager.style = style;
            document.head.appendChild(style);
        }
        style.innerHTML = `* { cursor: progress !important; }`;
        
        return FetchManager.ongoingCalls.has(key);
    }

    static startCall(key) {
        let style = FetchManager.style;

        if(!style){
            style = document.createElement("style");
            FetchManager.style = style;
            document.head.appendChild(style);
        }
        style.innerHTML = `* { cursor: progress !important; }`;
        FetchManager.ongoingCalls.set(key, true);
    }

    static endCall(key) {
        FetchManager.style.innerHTML = "";
        FetchManager.ongoingCalls.delete(key);
    }
}