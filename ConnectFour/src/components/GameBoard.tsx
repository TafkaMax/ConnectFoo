import { StyleSheet, View } from "react-native";
import React from 'react';
import { GameButton } from "./GameButton";
import { AppContextConsumer } from "../context/AppContext";
import { WinScreen } from "./WinScreen";
import { BlurView, VibrancyView } from "@react-native-community/blur";


type Props = {
    isPortrait: () => boolean
}


export const GameBoard = ({isPortrait} : Props) => {

    return (
    <AppContextConsumer>
            {
            value => 
                    
                    <View style={[styles.board_page, isPortrait() ? styles.vertical : styles.horizontal, value.isWon === true ? styles.obscured : null]}>
                            {[...value.boardState].map((row, rowIndex) => 
                            row.map((column, columnIndex) => 
                            <GameButton key={columnIndex} isPortrait= {isPortrait} playerType = {column} y = {rowIndex} x={columnIndex}/>))}
                            <BlurView style={styles.blurView} blurType="light" blurAmount={20} reducedTransparencyFallbackColor="gray"/>
                            { value.isWon && <WinScreen/>}
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
    },
    obscured: {
        opacity: 30
    },
    blurView: {
        position: "absolute",
        top: 0,
        left: 0,
        bottom: 0,
        right: 0
    }
});