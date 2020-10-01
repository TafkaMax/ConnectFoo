import { View, Button, StyleSheet } from "react-native";
import React, { useEffect } from 'react';
import { PlayerType, AppContextConsumer, IAppContext } from "../context/AppContext";
import { TouchableOpacity } from "react-native-gesture-handler";

type Props = {
    isPortrait : () => boolean
    playerType: PlayerType
    y: number,
    x: number,
}


const getStyle = (boardState : PlayerType[][], y: number, x: number) => {
    if(boardState[y][x] === 'R' ) {
        return styles.redplayer;
    } else if (boardState[y][x] === 'B') {
        return styles.blueplayer;
    } else {
        return styles.empty;
    }
}

const getCurrentPlayerType = (state : IAppContext) => {
    return state.nextMoveBy === "R" ? "R" : state.nextMoveBy === "B" ? "B" : "";
}

export const GameButton = ({isPortrait, playerType, y, x} : Props) => {

    return (
        <AppContextConsumer>
            { value => 
                <View style={[styles.cell, isPortrait() ? styles.vertical : styles.horizontal]}>
                    <TouchableOpacity 
                        onPress={() => {value.makeMove(getCurrentPlayerType(value), y, x)}} 
                        style={[styles.round, getStyle(value.boardState, y, x)]}>
                    </TouchableOpacity> 
                </View>
            }
        </AppContextConsumer>
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
        minWidth: '7.1%',
        minHeight: '14%',
        maxWidth: '14%',
        maxHeight: '16.6%',
    },
    vertical: {
        minWidth: '14%',
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