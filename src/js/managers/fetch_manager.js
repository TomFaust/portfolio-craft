export class FetchManager {
    static ongoingCalls = new Map();
    static style = null;

    static isCallOngoing(key) {
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

        if(FetchManager.ongoingCalls.has(key)){
            FetchManager.ongoingCalls.set(key, FetchManager.ongoingCalls.get(key) + 1);
        }else{
            FetchManager.ongoingCalls.set(key,1)
        }
    }

    static endCall(key) {
        if(FetchManager.ongoingCalls.get(key)){
            FetchManager.ongoingCalls.set(key, FetchManager.ongoingCalls.get(key) - 1);
            
            if(FetchManager.ongoingCalls.get(key) < 1){
                FetchManager.ongoingCalls.delete(key)
                FetchManager.style.innerHTML = ""
            }
        }
    }
}