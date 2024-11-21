import 'package:app_fullmedcare_v1/src/data/model/company.dart';
import 'package:app_fullmedcare_v1/src/data/provider/firebase_provider.dart';
import 'package:app_fullmedcare_v1/src/widgets/custom_bottom_sheet_company.dart';
import 'package:app_fullmedcare_v1/src/widgets/text_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCompaniesPageSearch extends StatefulWidget {
  const ListCompaniesPageSearch({super.key});

  @override
  State<ListCompaniesPageSearch> createState() =>
      _ListCompaniesPageSearchState();
}

class _ListCompaniesPageSearchState extends State<ListCompaniesPageSearch> {
  FirebaseProvider firebaseProvider = Get.find();
  List<Company> filteredCompanies = [];
  String _query = '';

  void search(String query, List<Company> listCompanies) {
    setState(() {
      _query = query;
      filteredCompanies = listCompanies.where((item) {
        final nameMatch = item.name.toLowerCase().contains(query.toLowerCase());
        final cnpjMatch = item.cnpj
            .toLowerCase()
            .replaceAll(RegExp(r'[.\-/]'), '')
            .contains(query.toLowerCase());
        return nameMatch || cnpjMatch;
      }).toList();
    });
  }

  void _showCustomBottomSheet(BuildContext context, Company company) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: CustomBottomSheetCompany(
          company: company,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Company> listCompanies = firebaseProvider.allCompanies;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Empresas cadastradas'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                await firebaseProvider.getAllCompanies();
              },
              icon: const Icon(Icons.replay_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) {
                search(value, listCompanies);
              },
              decoration: InputDecoration(
                hintText: 'Nome da empresa ou CNPJ',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(20.0), // Define o arredondamento
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      20.0), // Arredondado para o estado padrão
                  borderSide: const BorderSide(
                    color: Colors.grey, // Cor da borda no estado padrão
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      20.0), // Arredondado para o estado focado
                  borderSide: const BorderSide(
                    color: Colors.blue, // Cor da borda ao focar
                    width: 2.0, // Espessura da borda ao focar
                  ),
                ),
              ),
            ),
            Flexible(
              child: Obx(
                () => firebaseProvider.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : firebaseProvider.allCompanies.isEmpty
                        ? const Center(
                            child: Text('Nenhuma empresa cadastrada'))
                        : filteredCompanies.isNotEmpty || _query.isNotEmpty
                            ? filteredCompanies.isEmpty
                                ? const Center(
                                    child: Text('Nenhuma empresa encontrada.'),
                                  )
                                : ListView.builder(
                                    itemCount: filteredCompanies.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                          onTap: () {
                                            _showCustomBottomSheet(context,
                                                filteredCompanies[index]);
                                          },
                                          leading: SizedBox(
                                            width: 80,
                                            child: CircleAvatar(
                                              child: Text(
                                                  filteredCompanies[index]
                                                      .name[0]
                                                      .toUpperCase()),
                                            ),
                                          ),
                                          title: TextDetails(
                                            company: filteredCompanies[index],
                                          ));
                                    },
                                  )
                            : ListView.builder(
                                itemCount: listCompanies.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      ListTile(
                                          onTap: () {
                                            _showCustomBottomSheet(
                                                context, listCompanies[index]);
                                          },
                                          leading: SizedBox(
                                            width: 80,
                                            child: CircleAvatar(
                                              child: Text(listCompanies[index]
                                                  .name[0]
                                                  .toUpperCase()),
                                            ),
                                          ),
                                          title: TextDetails(
                                            company: listCompanies[index],
                                          )),
                                      const Divider()
                                    ],
                                  );
                                },
                              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
