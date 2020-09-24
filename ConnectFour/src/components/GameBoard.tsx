import { StyleSheet, Text, View } from "react-native";
import React from 'react';
import { GameButton } from "./GameButton";

type Props = {
    isPortrait: () => boolean
}

export const GameBoard = ({isPortrait}: Props) => {
    return (
    <View style={[styles.board_page, isPortrait() ? styles.vertical : styles.horizontal]}>
        {[...Array(42)].map((x, i) => <GameButton
        isPortrait = {isPortrait}
        />)}
    </View>
    );
}


const styles = StyleSheet.create({
    board_page: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#FF0000',
        padding: '0.5%',
        flexWrap: 'wrap'
    },
    vertical: {
        width: '100%',
        height: '50%',
    },
    horizontal: {
        width: '50%',
        height: '100%',
    }
});