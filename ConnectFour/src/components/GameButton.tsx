import { View, Button, StyleSheet } from "react-native";
import React, { cloneElement } from 'react';

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
        borderTopWidth: 1,
        borderLeftWidth: 1,
        borderRightWidth: 1,
        borderBottomWidth: 1,
        justifyContent: 'center',
        alignItems: 'center'
    },
    horizontal: {
        minWidth: '8.1%',
        minHeight: '14.28%',
        maxWidth: '16.6%',
        maxHeight: '14.28%',
    },
    vertical: {
        minWidth: '14.28%',
        minHeight: '8.1%',
        maxWidth: '14.28%',
        maxHeight: '16.6%',
    }
})