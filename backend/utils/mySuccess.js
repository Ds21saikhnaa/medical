const success = (data) => {
    return {
        statusCode: 200,
        body: JSON.stringify({
            success: true,
            data: data.toJSON()
        }),
    };
}

module.exports = {success}