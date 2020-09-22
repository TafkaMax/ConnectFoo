import { View, Button, StyleSheet } from "react-native";
import React from 'react';

export const GameButton = () => {
    return (
        <View style={styles.cell}>
            <Button title="testo" onPress={() => {}}/>
        </View>
    );
}

const styles = StyleSheet.create({
    cell: {
        backgroundColor: '#00FF00',
        flex: 1,
        minWidth: '14.28%',
        minHeight: '8.1%',
        maxWidth: '14.28%',
        maxHeight: '16.6%',
        borderTopWidth: 1,
        borderLeftWidth: 1,
        borderRightWidth: 1,
        borderBottomWidth: 1,
        justifyContent: 'center',
        alignItems: 'center'
    }
})