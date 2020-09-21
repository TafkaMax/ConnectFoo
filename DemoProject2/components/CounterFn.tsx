import React, { useState } from 'react';
import { Button, StyleSheet, Text, View} from 'react-native'

export interface Props {
    label1: string;
    label2: string;
    counter1initial: number;
    updateFn: (newValue: number) => void;
}

export const CounterFn = (props: Props) => {
    const [counter1, setCounter1] = useState(props.counter1initial);
    const [counter2, setCounter2] = useState(0);
    return (
        <View style={styles.size_h50}>
            <Button
                title="-"
                onPress={() => {
                    setCounter1(counter1 - 1);
                    setCounter2(counter2 - 1);
                    props.updateFn(counter1 - 1);
                }}
            />
            <Text>
                {props.label1} {counter1}
            </Text>
            <Text>
                {props.label2} {counter2}
            </Text>
            <Button
                title="+"
                onPress={() => {
                    setCounter1(counter1 + 1);
                    setCounter2(counter2 + 1);
                    props.updateFn(counter1 + 1);
                }}
            />
        </View>
    ); 
};

const styles = StyleSheet.create({
    size_h50: {
        flex: 1,
        width: '100%',
        height: '50%',
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#00FF00'
    }
});
