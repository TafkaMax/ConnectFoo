import { StyleSheet, View, Text } from "react-native";
import React from 'react';


export const GameStatistics = () => {
    return (
    <View style={styles.size_h50}>
        <Text>Test2</Text>
        <Text>Test3</Text>
        <Text>Test4</Text>
    </View>
    );
};


const styles = StyleSheet.create({
    size_h50: {
        flex: 1,
        width: '100%',
        height: '100%',
        justifyContent: 'space-evenly',
        alignItems: 'center',
    }
});