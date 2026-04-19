import QtQuick
import QtQuick.Layouts
import "../../../Colors.js" as T
import Quickshell.Services.Pipewire
import QtQuick.Controls

Rectangle {
	readonly property int currentVolume : Math.round(Pipewire.defaultAudioSink.audio.volume *100)
	PwObjectTracker {
		objects: Pipewire.defaultAudioSink
	}

	id: mainAudioButton
	Layout.alignment: Qt.AlignHCenter
	anchors.bottom: parent.bottom
	anchors.bottomMargin: 4
	width: 30
	height: width
	color: "transparent"
	Text {
		text: Pipewire.defaultAudioSink.audio.muted ? ""
		: (currentVolume >= 50)  ? ""
		: (currentVolume >= 25)  ? ""
		: ""
		//text: Math.round(Pipewire.defaultAudioSink.audio.volume *100) + "%"
		anchors.verticalCenter: parent.verticalCenter
		anchors.left: parent.left
		anchors.leftMargin: 7
		color: T.c.Accent1
		font.family: "Terminess Nerd Font"
	}
	MouseArea {
		anchors.fill : parent
		cursorShape: Qt.PointingHandCursor
		hoverEnabled: true
		onClicked: { Pipewire.defaultAudioSink.audio.muted = !Pipewire.defaultAudioSink.audio.muted }
		ToolTip {
			visible: parent.containsMouse
			text: currentVolume + "%"
			delay: 500
			font.family: "Terminess Nerd Font"
		}
		scrollGestureEnabled: true
		onWheel: (wheel)=> {
			Pipewire.defaultAudioSink.audio.volume = Pipewire.defaultAudioSink.audio.volume + ( 0.05 * wheel.angleDelta.y/120)
		}


	}

}