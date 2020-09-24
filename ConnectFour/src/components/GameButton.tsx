import { View, Button, StyleSheet } from "react-native";
import React from 'react';

type Props = {
    isPortrait : () => boolean
}

export const GameButton = ({isPortrait} : Props) => {
    return (
        <View style={[styles.cell, isPortrait() ? styles.vertical : styles.horizontal]}>
            <Button title="testo" onPress={() => {}}/>
        </View>
    );
}

const styles = StyleSheet.create({
    cell: {
        backgroundColor: '#00FF00',
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center'
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
    }
})