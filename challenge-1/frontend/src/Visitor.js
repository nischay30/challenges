import React from "react";
import request from 'superagent';
import api from './config.js'

class Visitor extends React.Component {
    constructor(props) {
        super(props);
        this.state = { visitor: 0};
      }

    componentDidMount() {
        this.fetchValue();
    }

    fetchValue() {
        request
            .get(api)
            .then(res => {
                this.setState({ visitor: JSON.parse(res.text)['status']});
        })
    }

    render() {
        return (
            <div>
                <h1> Visitor: {this.state.visitor} </h1>
            </div>
        )
    }
}

export default Visitor
