import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.components 3.0 as PlasmaComponents3

import "zstyle2" as ZStyle2

RowLayout {
	id: dateTimeSelector
	property var dateTime: new Date()
	property bool enabled: true
	property bool showTime: true
	property string dateFormat: "d MMM, yyyy"
	property string timeFormat: "HH:mm AP"

	ZStyle2.TextField {
		text: Qt.formatDateTime(dateTimeSelector.dateTime, dateTimeSelector.dateFormat)
		enabled: dateTimeSelector.enabled
		opacity: 1 // Override disabled opacity effect.
		inactiveBackgroundOpacity: enabled ? 1 : 0.4
		defaultMinimumWidth: 0
	}
	ZStyle2.TextField {
		text: Qt.formatDateTime(dateTimeSelector.dateTime, dateTimeSelector.timeFormat)
		enabled: dateTimeSelector.enabled && dateTimeSelector.showTime
		opacity: 1 // Override disabled opacity effect.
		inactiveBackgroundOpacity: enabled ? 1 : 0.4
		visible: dateTimeSelector.showTime
		defaultMinimumWidth: 0
	}


}
