import QtQuick 2.12

import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

BaseDelegate {

    TextField {
        id: valueElement
        anchors.right: parent.right
        font.pixelSize: 14
        topPadding: 0
        bottomPadding: 8
        horizontalAlignment: Text.AlignRight
        anchors.rightMargin: Qt.inputMethod.visible ? 96 : 36;
        anchors.top: parent.top
        anchors.topMargin: 12
        width: 192
        height: 32
        // @disable-check M223
        Component.onCompleted: {
            text = model.value
            cursorPosition = 0
        }
        // @disable-check M223
        onTextChanged: {
            model.value = text;
        }
        enabled: !model.disabled
    }
}
