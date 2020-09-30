import { StyleSheet, Text, View } from "react-native";
import React, { useState } from 'react';
import { GameButton } from "./GameButton";
import { IAppContext } from "../context/AppContext";

type Props = {
    isPortrait: () => boolean
    state: IAppContext
}

export const GameBoard = ({isPortrait, state}: Props) => {

    return (
    <View style={[styles.board_page, isPortrait() ? styles.vertical : styles.horizontal]}>
        {[...state.boardState].map((row, rowIndex) => row.map((column, columnIndex) => <GameButton key={columnIndex} isPortrait= {isPortrait} makeMove = {state.makeMove} playerType = {column} y = {rowIndex} x={columnIndex}/>))}
        {/* <GameButton isPortrait = {isPortrait} playerType = {state.boardState[i][]} /> */}
        {/* {[...state.boardState].map((x, i) => <GameButton isPortrait = {isPortrait} playerType = {state.boardState[i][]} />)} */}
        {/* {[...Array(42)].map((x, i) => <GameButton
        isPortrait = {isPortrait}
        />)} */}
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