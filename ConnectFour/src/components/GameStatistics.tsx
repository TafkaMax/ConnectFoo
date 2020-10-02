import { StyleSheet, View, Text, Button } from "react-native";
import React from 'react';
import { IAppContext, AppContextConsumer } from "../context/AppContext";
import { TouchableOpacity } from "react-native-gesture-handler";

export const GameStatistics = () => {
    return (
    <AppContextConsumer>
        { value => 
            <View style={styles.stat_page}>
                <Text style={styles.moves}>Number of moves : {value.moves}</Text>
                <Text style={styles.next_player}>Next move by player: {value.nextMoveBy === 'A' ? 'light player' : 'dark player'}</Text>
                <TouchableOpacity style={styles.reset_button_style} onPress={() => {value.startNewGame('B')}}>
                    <Text style={styles.reset_button}>
                        Reset Button
                    </Text>
                </TouchableOpacity>
            </View>
        }
    </AppContextConsumer>
    );
};


const styles = StyleSheet.create({
    stat_page: {
        flex: 1,
        width: '100%',
        height: '100%',
        justifyContent: 'space-evenly',
        alignItems: 'center',
    },
    moves: {
        fontSize: 30,
        fontFamily: 'Abel-Regular'
    },
    next_player: {
        fontSize: 30,
        fontFamily: 'Abel-Regular'
    },
    reset_button: {
        fontSize: 20,
        fontFamily: 'Abel-Regular'
    },
    reset_button_style: {
        borderRadius: 15,
        backgroundColor: '#A7CA47',
        padding: 15,
    }
});