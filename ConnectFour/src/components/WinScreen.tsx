import React from 'react';
import { StyleSheet, View, Text } from "react-native";
import { AppContextConsumer } from '../context/AppContext';


export const WinScreen = () => (
        <AppContextConsumer>
            { value =>
                <View style={styles.winscreen}>
                    <Text style={styles.wintext}>{value.nextMoveBy === "R" ? "Blue" : "Red"} has won!</Text>
                </View>
            }
        </AppContextConsumer>
);
    

const styles = StyleSheet.create({
    winscreen : {
        justifyContent: 'center',
        alignItems: 'center',
        width: '100%',
        height: '100%',
        position: 'absolute'
    },
    wintext : {
        fontSize: 50,
        fontFamily: 'Abel-Regular'
    }
});