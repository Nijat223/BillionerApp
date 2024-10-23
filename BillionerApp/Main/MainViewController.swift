//
//  MainViewController.swift
//  BillionerApp
//
//  Created by Nijat Shikhaliyev on 07.10.24.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet private weak var collection: UICollectionView!
    @IBOutlet private weak var nextQuestionButton: UIButton!
    var books = [listModel]()
    var currentQuestionIndex = 0
    private var result:[Answer] = []
    private var questions: [Question] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        generateQuestions()
        configureView()
//        UserDefaultsHelper.setInteger(key: "LoginType", value: 2)
        UserDefaultsHelper.setInteger(key: UserDefaultsKey.loginType.rawValue, value: 2)
    }

    fileprivate func configureView() {
        configureCollection()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    fileprivate func configureCollection() {
        collection.delegate = self
        collection.dataSource = self
        collection.isScrollEnabled = false
        collection.register(UINib(nibName: "AnswerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AnswerCollectionViewCell")
    }
    
    fileprivate func generateQuestions() {
        //TODO: should use Json
        questions = [
            Question(
                title: "What's the capital of Azerbaijan?",
                answer: [
                    Answer(title: "Gadabay", correct: false),
                    Answer(title: "Ganja", correct: false),
                    Answer(title: "Sumgait", correct: false),
                    Answer(title: "Baku", correct: true),
                    
                ]
            ),
            Question(
                title: "What's ur name?",
                answer: [
                    Answer(title: "Kanan", correct: false),
                    Answer(title: "Yusif", correct: false),
                    Answer(title: "Orxan", correct: false),
                    Answer(title: "Nijat", correct: true),
                    
                ]
            ),
            Question(
                title: "How old are u?",
                answer: [
                    Answer(title: "15", correct: false),
                    Answer(title: "25", correct: false),
                    Answer(title: "35", correct: false),
                    Answer(title: "65", correct: true),
                    
                ]
            )
        ]
        
        reloadCollection()
    }
    
    fileprivate func reloadCollection() {
        DispatchQueue.main.async { [weak self] in
            self?.collection.reloadData()
        }
    }
    
    fileprivate func checkAnswer(answer: Answer) {
            result.append(answer)
    //        if answer.correct {
    //            result = result + 1
    //        }
            print(#function, result.filter({$0.correct}).count)
        }

}

extension MainViewController: UICollectionViewDelegate,
                              UICollectionViewDataSource,
                              UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        questions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnswerCollectionViewCell", for: indexPath) as! AnswerCollectionViewCell
        let model = questions[indexPath.row]
        cell.configureCell(model: model)
        cell.callback = { [weak self] answer in
            self?.checkAnswer(answer: answer)
        }
        return cell
    }
    
    @IBAction func nextQuestionButtonTapped(_ sender: UIButton) {
        
        let indexPath = IndexPath(row: 0, section: 0) // Cavabın olduğu hüceyrənin indeks yolu
        if let cell = collection.cellForItem(at: indexPath) as? AnswerTitleCell {
            let answer = cell.answerLabel.text
            //            print(answer)
            
        }
        currentQuestionIndex += 1
        
        if currentQuestionIndex < questions.count {
            let indexPath = IndexPath(item: currentQuestionIndex, section: 0)
            collection.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            if currentQuestionIndex == questions.count-1{
                nextQuestionButton.setTitle("Submit", for:.normal)
                
                
            }
            
        }
        
        else {
            let nextVC = storyboard?.instantiateViewController(withIdentifier: "Leaderboard") as! Leaderboard
            navigationController?.pushViewController(nextVC, animated: true)
        }
    }
       
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return .init(width: collectionView.frame.width, height: collectionView.frame.height)
        }
        
    }
