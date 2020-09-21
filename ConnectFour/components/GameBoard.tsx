import { StyleSheet, Text, View } from "react-native";
import React from 'react';
import { GameButton } from "./GameButton";

export const GameBoard = () => {
    return (
    <View style={styles.size_h50}>
        {[...Array(42)].map((x, i) => <GameButton/>)}
    </View>
    );
}


const styles = StyleSheet.create({
    size_h50: {
        flex: 1,
        width: '100%',
        height: '50%',
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#FF0000',
        padding: '2%',
        flexWrap: 'wrap'
    }
});