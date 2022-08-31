import UIKit
import RxSwift
import RxCocoa

/// 1. observable
/*
let observable = Observable.just(1)
let observable2 = Observable.of(1, 2, 3)
let observable3 = Observable.of([1, 2, 3]) // next([1, 2, 3]) event 발생
let observable4 = Observable.from([1, 2, 3, 4, 5]) // next(1) ~ next(5) event 발생

observable4.subscribe { event in
    if let element = event.element {
        print(element)
    }
}

observable3.subscribe { event in
    if let element = event.element {
        print(element)
    }
}

let subscription4 = observable4.subscribe(onNext: { element in
    print(element)
})

subscription4.dispose()
*/



/// 2. disposebag
/*
let disposeBag = DisposeBag() // 스트림 종료

Observable.of("A", "B", "C")
.subscribe {
        print($0)
}.disposed(by: disposeBag)

Observable<String>.create { observer in
    observer.onNext("A")
    observer.onCompleted() // 완료 시점
    observer.onNext("?") // 이전에 완료되었기때문에 출력 x
    return Disposables.create()
}.subscribe(onNext: { print($0) }, onError: { print($0) }, onCompleted: { print("completed") }, onDisposed: { print("disposed") })
.disposed(by: disposeBag)
 */


/// 3. PublishSubject
/// 순서 : event -> subject -> subscribers
/// subscribe를 하고 있어야 event 감지를 할 수 있다. (?)
/*
let disposeBag = DisposeBag()
let subject = PublishSubject<String>()

subject.onNext("Issue 1")

subject.subscribe { event in
    print(event)
}

subject.onNext("Issue 2")
subject.onNext("Issue 3")

//subject.dispose() // 스트림 종료
subject.onCompleted() // 완료

subject.onNext("Issue 4")
*/



/// 4. BehaviorSubject
/// subject 선언 시, 초기 value 값을 설정할 수 있다.
/// subscribe 시 value 값이 출력된다.
/*
let disposeBag = DisposeBag()
let subject = BehaviorSubject(value: "Initial Value")

subject.onNext("Last Issue")

subject.subscribe { event in
    print(event)
}

subject.onNext("Issue 1")
*/



/// 5. ReplaySubject
/// subscribe 시 기존에 등록된 onNext() event를 다시 구독한다.
/*
let disposeBag = DisposeBag()
let subject = ReplaySubject<String>.create(bufferSize: 2) // subject가 가지는 buffer 사이즈를 지정한다.

subject.onNext("Issue 1")
subject.onNext("Issue 2")
subject.onNext("Issue 3")

subject.subscribe {
    print($0)
}

subject.onNext("Issue 4")

print("[Subscription 1]")

subject.subscribe {
    print($0)
}

subject.onNext("Issue 5")
subject.onNext("Issue 6")

print("[Subscription 2]")

subject.subscribe {
    print($0)
}
*/



/// 6. Variables
/*
let disposeBag = DisposeBag()
let variable = Variable([String]()) // 왜 없다고 뜨는건지

variable.value.append("Item 1")
variable.asObsevable()
    .subscribe {
        print($0)
}

variable.value.append("Item 2")
 
/* 결과
> next(["Item 1"])
> next(["Item 1", "Item 2"])
*/
*/




/// 7. BehaviorReplay
/// RxSwift의 BehaviorSubject와 비슷하다.
/// Rxcocoa의 accpet()와 RxSwift의 value.append()는 같은 의미를 가지고 있다
/*
let disposeBag = DisposeBag()
let relay = BehaviorRelay(value: ["Item 1"])

var value = relay.value
value.append("Item 2")
value.append("Item 3")
relay.accept(value)

//relay.accept(["Item 2"])
//relay.accept(relay.value + ["Item 3"] )

relay.asObservable()
    .subscribe {
        print($0)
}
*/
