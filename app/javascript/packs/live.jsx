import React from 'react';
import ReactDOM from 'react-dom';
import {hashHistory, IndexRoute} from "react-router";

import ApolloClient from "apollo-boost";
import {ApolloProvider} from 'react-apollo';

import RegionalMap from './../src/components/RegionalMap'

const client = new ApolloClient({
    uri: "/api/graphql"
});

const Root = () => {
    return (
        <ApolloProvider client={client}>
            <RegionalMap/>
        </ApolloProvider>
    )
};

ReactDOM.render(
    <Root/>, document.querySelector('#root')
);