/// <reference path="jquery-1.9.1.min.js" />
/// <reference path="jquery.signalR-1.2.2.min.js" />
$(function () {
    $.connection.hub.url = "../signalr/hubs";
    signalr = function () {
        var _connectionDeferred;
        var _connectionStart = function (callback) {
            if (!_connectionDeferred) {
                _connectionDeferred = $.connection.hub.start();
            }
            if ($.connection.hub.state == $.connection.connectionState.connected && callback) {
                callback();
            } else if (callback) {
                $.connection.hub.stop();
                _connectionDeferred = $.connection.hub.start().done(callback);
            }
        };
        return {
            connection_start: _connectionStart,
            client_proxy: $.connection.clientHub,
            manage_proxy: $.connection.manageHub
        };
    }();
});