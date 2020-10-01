import { StyleSheet, Text, View } from "react-native";
import React, { useState } from 'react';
import { GameButton } from "./GameButton";
import { IAppContext, AppContextConsumer } from "../context/AppContext";

type Props = {
    isPortrait: () => boolean
}


export const GameBoard = ({isPortrait} : Props) => {

    return (
    <AppContextConsumer>
            {
            value => 
                <View style={[styles.board_page, isPortrait() ? styles.vertical : styles.horizontal]}>
                    {[...value.boardState].map((row, rowIndex) => 
                    row.map((column, columnIndex) => 
                    <GameButton key={columnIndex} isPortrait= {isPortrait} playerType = {column} y = {rowIndex} x={columnIndex}/>))}
                </View>
            }
    </AppContextConsumer>
    );
}


const styles = StyleSheet.create({
    board_page: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#FF0000',
        flexWrap: 'wrap',
        flexDirection: 'row'
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