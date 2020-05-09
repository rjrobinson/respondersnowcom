import React from 'react';
import ReactDOM from 'react-dom';
// import {hashHistory, IndexRoute} from "react-router";

import ApolloClient from "apollo-boost";
import {ApolloProvider} from 'react-apollo';

import CertApplication from "././../src/components/CertApplication/CertApplication.jsx";

const client = new ApolloClient({
    uri: "/api/graphql"
});

const Root = () => {
    return (
        <ApolloProvider client={client}>
            <CertApplication/>
        </ApolloProvider>
    )
};

ReactDOM.render(
    <Root/>, document.querySelector('#root')
);