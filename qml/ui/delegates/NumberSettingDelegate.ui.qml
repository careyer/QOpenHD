import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

BaseDelegate {

    SpinBox {
        id: choiceBox
        width: 210
        height: 48
        font.pixelSize: 14
        from: model.lowerLimit
        to: model.upperLimit
        stepSize: 1
        value: model.value
        anchors.right: parent.right
        anchors.rightMargin: Qt.inputMethod.visible ? 78 : 18
        anchors.top: parent.top
        anchors.topMargin: 8
        // @disable-check M223
        onValueChanged: {
            model.value = value
        }
        enabled: !model.disabled
    }
}
