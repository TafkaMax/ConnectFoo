import { Component } from "react";
import { Button, Text } from "react-native";


export interface Props {
    label1: string,
    label2: string,
    counter1initial: number;
}

export interface State {
    counter1: number,
    counter2: number
}

export class CounterClass extends Component<Props, State> {
    /**
     *
     */
    constructor(props: Props) {
        super(props);
        this.state = {
            counter1: props.counter1initial,
            counter2: 0
        }
    }

    render() {
        return (
            <>
                <Button
                    title="-"
                    onPress={() =>
                        this.setState({
                            counter1: this.state.counter1 -1,
                            counter2: this.state.counter2 -1
                        })
                    }
                />
                <Text>
                    {this.props.label1} {this.state.counter1}
                </Text>
                <Text>
                    {this.props.label2} {this.state.counter2}
                </Text>
                <Button
                    title="+"
                    onPress={() => 
                        this.setState({
                            counter1: this.state.counter1 + 1,
                            counter2: this.state.counter2 + 1
                            })
                    }
                />
            </>
        );
    }
}