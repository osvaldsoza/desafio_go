FROM golang:1.9.6 as BUILDER

WORKDIR /app

COPY main.go .

RUN go build -o fullCycleRocks .

FROM scratch

COPY --from=BUILDER /app/fullCycleRocks ./fullCycleRocks

CMD [ "./fullCycleRocks" ]
