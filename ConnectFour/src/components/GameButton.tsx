import { View, Button, StyleSheet } from "react-native";
import React, { useEffect } from 'react';
import { PlayerType } from "../context/AppContext";
import { TouchableOpacity } from "react-native-gesture-handler";

type Props = {
    isPortrait : () => boolean
    playerType: PlayerType
    y: number,
    x: number,
    makeMove: () => void
}


export const GameButton = ({isPortrait, playerType, x, y, makeMove} : Props) => {

    return (
        <View style={[styles.cell, isPortrait() ? styles.vertical : styles.horizontal]}>
            <TouchableOpacity onPress={() => {makeMove()}} style={[styles.round, playerType === "R" ? styles.redplayer : playerType === "B" ? styles.blueplayer : styles.empty]}>
                {playerType}    
            </TouchableOpacity> 
        </View>

    );
}

const styles = StyleSheet.create({
    cell: {
        backgroundColor: '#00FF00',
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
    },
    horizontal: {
        minWidth: '8.1%',
        minHeight: '14.2857142857%',
        maxWidth: '14.2857142857%',
        maxHeight: '16.6%',
    },
    vertical: {
        minWidth: '14.2857142857%',
        minHeight: '8.1%',
        maxWidth: '14.2857142857%',
        maxHeight: '16.6%',
    },
    round: {
        width: '100%',
        height: '100%',
        justifyContent: 'center',
        alignItems: 'center',
        padding: 25,
        borderRadius: 100,
        backgroundColor: 'orange',
        borderColor: 'gray',
        borderWidth: 1
    },
    redplayer: {
        backgroundColor: 'red'
    },
    blueplayer: {
        backgroundColor: 'blue'
    },
    empty: {
        backgroundColor: 'white'
    }
})